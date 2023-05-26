ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

FROM ${BASE_IMAGE} as dev-base

WORKDIR /

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash
RUN apt-get update --yes && \
    # - apt-get upgrade is run to patch known vulnerabilities in apt-get packages as
    #   the ubuntu base image is rebuilt too seldom sometimes (less than once a month)
    apt-get upgrade --yes && \
    apt install --yes --no-install-recommends \
    git \
    wget \
    curl \
    bash \
    libgl1 \
    software-properties-common \
    vim net-tools iftop iotop rsync tzdata \
    dnsutils git-lfs \
    openssh-server && \
    echo "# 安装python3相关的套件" && \
    apt install python3-dev python3-venv -y --no-install-recommends && \
    apt install python-is-python3 && \
    echo "# 安装nvtop" && \
    add-apt-repository -y ppa:flexiondotorg/nvtop && \
    apt install -y nvtop && \
    echo "# 清理apt" && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "# config locale" && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "# 配置时区" && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone

    # 快速安装pip相关套件
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

    # 安装jupyterlab, nvitop和envkernel
RUN pip install -U jupyterlab==3.6.3 ipywidgets jupyter-archive notebook && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension disable "@jupyterlab/apputils-extension:announcements" && \
    pip install --upgrade nvitop && pip install envkernel tqdm && \
    pip cache purge

    # 在/workspace创建python env,并移动到/workspace-tmp目录下防止云端挂载时被覆盖
RUN mkdir /workspace && \
    cd /workspace && \
    python -m venv venv && \
    /workspace/venv/bin/python -m pip install --upgrade pip && \
    /workspace/venv/bin/python -m pip install ipykernel ipywidgets tqdm && \
    /workspace/venv/bin/python -m pip cache purge && \
    envkernel virtualenv --user --name=nb-venv --display-name="Notebook(venv)" /workspace/venv && \
    echo "alias activate_venv='source /workspace/venv/bin/activate'" >> /root/.bashrc && \
    mv /workspace /workspace-tmp



ADD start.sh /
# 执行启动脚本
RUN chmod +x /start.sh

EXPOSE 22 8888
ENTRYPOINT [ "/start.sh" ]

