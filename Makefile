build:
	docker build -t build-latest-tflite-runtime .

run-test:
	docker run -it --rm \
		-v $(PWD):$(PWD) \
		-w $(PWD) \
		--name test-tflite-runtimer \
		build-latest-tflite-runtime \
		/bin/bash -c \
		"pip install /tensorflow_src/tensorflow/lite/tools/pip_package/gen/tflite_pip/python/dist/tflite_runtime-2.6.0-cp36-cp36m-linux_x86_64.whl; \
		python test_interpreter.py"
