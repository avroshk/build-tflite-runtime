# Steps to reproduce the error while building tflite-runtime pip package using bazel
* Refer: https://github.com/tensorflow/tensorflow/issues/49198 
* Check https://github.com/avroshk/build-tflite-runtime/tree/fix branch for the fix

# build-tflite-runtime
Dockerfile for building tflite-runtime from source using bazel

### Build tflite_runtime pip package
* Setup build environment using the latest-devel as base docker container
* Build tflite-runtime using `tensorflow/lite/tools/pip_package/build_pip_package_with_bazel.sh`
* Run the following command to execute the build.
```
make build
```

### Run tflite_runtime
* Install built tflite-runtime
* Try to import `tflite_runtime.interpreter`
```
make run-test
```
* Error encountered 
```
tflite_runtime==2.6.0
Traceback (most recent call last):
  File "test_interpreter.py", line 4, in <module>
    import tflite_runtime.interpreter as tflite
  File "/usr/local/lib/python3.6/dist-packages/tflite_runtime/interpreter.py", line 42, in <module>
    from tflite_runtime import metrics_portable as metrics
ImportError: cannot import name 'metrics_portable'
```
