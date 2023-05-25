ARG BASE_IMAGE=sharpbai/runpod-torch:2.0.0-cuda11.8.0-cudnn8-devel-ubuntu22.04
ARG APP_VERSION=v21.5.10

FROM ${BASE_IMAGE} as dev-base

RUN apt-get update --yes && \
    apt install --yes libglib2.0-0 libgoogle-perftools-dev \
    libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev \
    tk8.6-dev libharfbuzz-dev libfribidi-dev libxcb1-dev \
    python3.10-tk libgl1 python3-html5lib && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/*


    # 使用/workspace venv,并挪到/workspace-tmp目录下防止云端挂载时被覆盖
RUN ln -s /workspace-tmp /workspace && \
    source /workspace/venv/bin/activate && \
    cd /workspace && \
    echo "#Start add cmd in venv" > /dev/null && \
    git clone https://github.com/bmaltais/kohya_ss.git && \
    cd kohya_ss && git checkout ${APP_VERSION} && \
    echo "#Install kohya_ss deps" > /dev/null && \
    pip install --use-pep517 -r requirements.txt xformers && \
    echo "#Replace pillow with pillow-simd" > /dev/null && \
    pip uninstall -y pillow && \
    CC="cc -mavx2" pip install -U \
    --force-reinstall pillow-simd && \
    echo "# Fix missing libnvinfer7" > /dev/null && \
    ln -s /usr/lib/x86_64-linux-gnu/libnvinfer.so \
    /usr/lib/x86_64-linux-gnu/libnvinfer.so.7 && \
    ln -s /usr/lib/x86_64-linux-gnu/libnvinfer_plugin.so \
    /usr/lib/x86_64-linux-gnu/libnvinfer_plugin.so.7 && \
    echo "alias activate_app='source /workspace/venv/bin/activate && cd kohya_ss && python kohya_gui.py --server_port 7860 --listen 0.0.0.0 --headless'" >> /root/.bashrc && \
    echo "#End add cmd in venv" > /dev/null && \
    cd / && \
    pip cache purge && deactivate && \
    rm /workspace

EXPOSE 7860
EXPOSE 7861

# Hide welcome message from bitsandbytes
ENV BITSANDBYTES_NOWELCOME="1"

# Hide message from tensorflow
ENV TF_CPP_MIN_LOG_LEVEL="3"

# Provide default environment variables
ENV LD_PRELOAD=libtcmalloc.so