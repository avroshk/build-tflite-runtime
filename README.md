# build-tflite-runtime
Dockerfile for building tflite-runtime from source using bazel

### Build tflite_runtime pip package from source in the docker container  
```
make build
```

### Run tflite_runtime
```
make run-test
```

### Error encountered
```
tflite_runtime==2.6.0
Traceback (most recent call last):
  File "test_interpreter.py", line 4, in <module>
    import tflite_runtime.interpreter as tflite
  File "/usr/local/lib/python3.6/dist-packages/tflite_runtime/interpreter.py", line 42, in <module>
    from tflite_runtime import metrics_portable as metrics
ImportError: cannot import name 'metrics_portable'
```
