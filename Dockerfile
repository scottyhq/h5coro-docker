# syntax = docker/dockerfile:1.4
ARG MAMBA_VERSION=1.4.3

FROM docker.io/mambaorg/micromamba:${MAMBA_VERSION} as app

ENV SHELL=/bin/bash \
    LANG=C.UTF-8  \
    LC_ALL=C.UTF-8

COPY --link environment.yml* /tmp/env.yml

RUN --mount=type=cache,target=/opt/conda/pkgs <<eot
    micromamba install -y -n base -f /tmp/env.yml
    micromamba clean --all --yes
eot

ARG MAMBA_DOCKERFILE_ACTIVATE=1  # (otherwise python will not be found)

RUN <<eot
    git clone https://github.com/ICESat2-SlideRule/sliderule.git
    cd sliderule/targets/binding-python
    make config-conda
    make
    make install INSTALL_DIR=/opt/conda/lib/python3.11/lib-dynload
eot
