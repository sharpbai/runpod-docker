ARG TORCH_BASE_IMG_VERSION=passed-by-build-arg
ARG APP_VERSION=v1.0.0

FROM sharpbai/runpod-torch:${TORCH_BASE_IMG_VERSION} as dev-base

ARG APP_VERSION

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update --yes && \
    apt install --yes libtcmalloc-minimal4 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

    # 使用/workspace venv,并挪到/workspace-tmp目录下防止云端挂载时被覆盖
RUN ln -s /workspace-tmp /workspace && \
    source /workspace/venv/bin/activate && \
    cd /workspace && \
    echo "#Start add cmd in venv" > /dev/null && \
    # 克隆代码库
    git clone --depth 1 -b v1.0.0 \
    https://github.com/sharpbai/Huatuo-Llama-Med-Chinese.git && \
    cd Huatuo-Llama-Med-Chinese && \
    echo "#Install Huatuo-Llama-Med-Chinese deps" > /dev/null && \
    pip install -r requirements.txt && \
    echo "#End add cmd in venv" > /dev/null && \
    cd / && \
    pip cache purge && deactivate && \
    rm /workspace

# Hide welcome message from bitsandbytes
ENV BITSANDBYTES_NOWELCOME="1"

# Hide message from tensorflow
ENV TF_CPP_MIN_LOG_LEVEL="3"

# Provide default environment variables
ENV LD_PRELOAD=libtcmalloc_minimal.so.4
