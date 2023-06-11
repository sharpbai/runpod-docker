TORCH_BASE_IMG_VERSION=2.0.1-cuda11.8.0-cudnn8-devel-ubuntu22.04
CUDA_VERSION=cu118
docker build \
--build-arg TORCH_BASE_IMG_VERSION=${TORCH_BASE_IMG_VERSION} \
-t runpod-huatuo_llama_med:1.0.0-${CUDA_VERSION} \
-t $(whoami)/runpod-huatuo_llama_med:1.0.0-${CUDA_VERSION} .

TORCH_BASE_IMG_VERSION=2.1.0-cuda12.1.1-cudnn8-devel-ubuntu22.04
CUDA_VERSION=cu121
docker build \
--build-arg TORCH_BASE_IMG_VERSION=${TORCH_BASE_IMG_VERSION} \
-t runpod-huatuo_llama_med:1.0.0-${CUDA_VERSION} \
-t $(whoami)/runpod-huatuo_llama_med:1.0.0-${CUDA_VERSION} .
