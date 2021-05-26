# Quick fix for error encountered while building tflite-runtime 
* Refer PR: https://github.com/tensorflow/tensorflow/pull/49199

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
* Output
```
tflite_runtime==2.6.0
~Great Success~
```
