FROM tensorflow/tensorflow:latest-devel

WORKDIR /tensorflow_src

# Switch to target branch
RUN git pull
RUN git checkout master

# Install Bazel
# Check compatibility here: https://www.tensorflow.org/install/source#cpu
ENV BAZEL_VERSION=3.7.2
ENV BAZEL_INSTALLER=bazel-$BAZEL_VERSION-installer-linux-x86_64.sh
ENV BAZEL_PATH=https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/$BAZEL_INSTALLER
RUN wget $BAZEL_PATH -P /tmp -q
RUN chmod +x /tmp/$BAZEL_INSTALLER
WORKDIR /tmp
RUN ./$BAZEL_INSTALLER

# Setup env variables for TensorFlow ./configure
ENV PYTHON_BIN_PATH=/usr/bin/python3
ENV PYTHON_LIB_PATH=/usr/lib/python3/dist-packages
ENV TF_NEED_OPENCL_SYCL=0
ENV TF_NEED_ROCM=0
ENV TF_NEED_CUDA=0
ENV TF_CUDA_CLANG=0
ENV CC_OPT_FLAGS="-march=native -Wno-sign-compare"
ENV TF_SET_ANDROID_WORKSPACE=0

# Build TensorFlow
WORKDIR /tensorflow_src
RUN ./configure

COPY build_pip_package_with_bazel.sh tensorflow/lite/tools/pip_package/build_pip_package_with_bazel.sh
RUN chmod +x tensorflow/lite/tools/pip_package/build_pip_package_with_bazel.sh
RUN tensorflow/lite/tools/pip_package/build_pip_package_with_bazel.sh
