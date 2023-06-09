CUDA_BASE_IMG_VERSION=11.7.1-cudnn8-devel-ubuntu20.04
docker build --build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-cuda:${CUDA_BASE_IMG_VERSION} \
-t $(whoami)/runpod-cuda:${CUDA_BASE_IMG_VERSION} .

CUDA_BASE_IMG_VERSION=11.8.0-cudnn8-devel-ubuntu20.04
docker build --build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-cuda:${CUDA_BASE_IMG_VERSION} \
-t $(whoami)/runpod-cuda:${CUDA_BASE_IMG_VERSION} .

CUDA_BASE_IMG_VERSION=11.8.0-cudnn8-devel-ubuntu22.04
docker build --build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-cuda:${CUDA_BASE_IMG_VERSION} \
-t $(whoami)/runpod-cuda:${CUDA_BASE_IMG_VERSION}  .

CUDA_BASE_IMG_VERSION=12.1.1-cudnn8-devel-ubuntu22.04
docker build --build-arg CUDA_BASE_IMG_VERSION=${CUDA_BASE_IMG_VERSION} \
-t runpod-cuda:${CUDA_BASE_IMG_VERSION} \
-t $(whoami)/runpod-cuda:${CUDA_BASE_IMG_VERSION} \
-t runpod-cuda:latest \
-t $(whoami)/runpod-cuda:latest .
