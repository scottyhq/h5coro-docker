# h5coro

```bash
docker build -t h5coro:test .
docker run --rm -it h5coro:test python -c 'import srpybin'
```

```pytb
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: /opt/conda/lib/python3.11/lib-dynload/srpybin.cpython-311-x86_64-linux-gnu.so: undefined symbol: _Z11lua_pushnilP9lua_State
```
