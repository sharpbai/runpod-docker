ARG BASE_IMAGE=sharpbai/runpod-torch:2.0.0-cuda11.8.0-cudnn8-devel-ubuntu22.04
FROM ${BASE_IMAGE} as dev-base


    # 使用/workspace venv,并挪到/workspace-tmp目录下防止云端挂载时被覆盖
RUN ln -s /workspace-tmp /workspace && \
    source /workspace/venv/bin/activate && \
    cd /workspace && \
    echo "#Start add cmd in venv" > /dev/null && \
    git clone https://github.com/hyperonym/basaran.git && \
    cd basaran && git checkout v0.17.2 && \
    pip install accelerate bitsandbytes && \
    pip install -r requirements.txt && \
    echo "#End add cmd in venv" > /dev/null && \
    cd / && \
    pip cache purge && deactivate && \
    rm /workspace

EXPOSE 7860

# Force the stdout and stderr streams to be unbuffered
ENV PYTHONUNBUFFERED="1"

# Hide welcome message from bitsandbytes
ENV BITSANDBYTES_NOWELCOME="1"

# Provide default environment variables
ENV MODEL=""
ENV HOST="0.0.0.0"
ENV PORT="7860"
ENV MODEL_REVISION=""
ENV MODEL_CACHE_DIR="/workspace/models"
ENV MODEL_LOAD_IN_8BIT="false"
ENV MODEL_LOCAL_FILES_ONLY="false"
ENV MODEL_TRUST_REMOTE_CODE="false"
ENV MODEL_HALF_PRECISION="true"
ENV SERVER_THREADS="32"
ENV SERVER_IDENTITY="basaran"
ENV SERVER_CONNECTION_LIMIT="1024"
ENV SERVER_CHANNEL_TIMEOUT="300"
ENV SERVER_MODEL_NAME=""
ENV SERVER_NO_PLAYGROUND="false"
ENV SERVER_CORS_ORIGINS="*"
ENV COMPLETION_MAX_PROMPT="32768"
ENV COMPLETION_MAX_TOKENS="8192"
ENV COMPLETION_MAX_N="5"
ENV COMPLETION_MAX_LOGPROBS="5"
ENV COMPLETION_MAX_INTERVAL="50"
ENV CUDA_MEMORY_FRACTION="1.0"