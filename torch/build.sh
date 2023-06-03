TORCH_CUDA_VERSION=cu117
CUDA_BASE_IMG_VERSION=11.7.1-cudnn8-devel-ubuntu22.04
docker build \
--build-arg TORCH_CUDA_VERSION=${TORCH_CUDA_VERSION} \
--build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-torch:2.0.1-cuda${CUDA_BASE_IMG_VERSION} .

TORCH_CUDA_VERSION=cu118
CUDA_BASE_IMG_VERSION=11.8.0-cudnn8-devel-ubuntu22.04
docker build \
--build-arg TORCH_CUDA_VERSION=${TORCH_CUDA_VERSION} \
--build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-torch:2.0.1-cuda${CUDA_BASE_IMG_VERSION} -t runpod-torch:latest .
