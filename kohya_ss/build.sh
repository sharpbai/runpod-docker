TORCH_BASE_IMG_VERSION=2.0.1-cuda11.8.0-cudnn8-devel-ubuntu22.04
CUDA_VERSION=cu118
docker build \
--build-arg TORCH_BASE_IMG_VERSION=${TORCH_BASE_IMG_VERSION} \
-t runpod-kohya_ss:21.5.10-${CUDA_VERSION} \
-t $(whoami)/runpod-kohya_ss:21.5.10-${CUDA_VERSION} .

TORCH_BASE_IMG_VERSION=2.0.1-cuda12.0.1-cudnn8-devel-ubuntu22.04
CUDA_VERSION=cu120
docker build \
--build-arg TORCH_BASE_IMG_VERSION=${TORCH_BASE_IMG_VERSION} \
-t runpod-kohya_ss:21.5.10-${CUDA_VERSION} \
-t $(whoami)/runpod-kohya_ss:21.5.10-${CUDA_VERSION} \
-t runpod-kohya_ss:latest \
-t $(whoami)/runpod-kohya_ss:latest .
