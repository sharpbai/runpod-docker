ARG BASE_IMAGE=sharpbai/runpod-cuda:11.8.0-cudnn8-devel-ubuntu22.04
FROM ${BASE_IMAGE} as dev-base

    # 使用/workspace venv,并挪到/workspace-tmp目录下防止云端挂载时被覆盖
RUN ln -s /workspace-tmp /workspace && \
    source /workspace/venv/bin/activate && \
    echo "#从下方开始添加venv内命令" > /dev/null && \
    pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 \
    --index-url https://download.pytorch.org/whl/cu118 \
    --extra-index-url https://pypi.org/simple && \
    rm /workspace/venv/lib/python3.10/site-packages/torch/lib/libcudnn* && \
    rm /workspace/venv/lib/python3.10/site-packages/torch/lib/libnvrtc-builtins* && \
    rm /workspace/venv/lib/python3.10/site-packages/torch/lib/libcublas* && \
    echo "#结束添加venv内命令" > /dev/null && \
    pip cache purge && deactivate && \
    rm /workspace