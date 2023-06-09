TORCH_CUDA_VERSION=nightly/cu121
CUDA_BASE_IMG_VERSION=12.0.1-cudnn8-devel-ubuntu22.04
PYTHON_LIB_NAME=python3.10
docker build \
--build-arg TORCH_CUDA_VERSION=${TORCH_CUDA_VERSION} \
--build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
--build-arg PYTHON_LIB_NAME=${PYTHON_LIB_NAME} \
-t runpod-torch:2.0.1-cuda${CUDA_BASE_IMG_VERSION} \
-t $(whoami)/runpod-torch:2.0.1-cuda${CUDA_BASE_IMG_VERSION} .
