FROM ubuntu:focal as dev-base

WORKDIR /

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash
ADD sources.list /etc/apt/

RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list && \
    apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    software-properties-common wget dirmngr && \
    # 添加自定义apt repo
    add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y && \
    add-apt-repository ppa:cran/libgit2 -y && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    add-apt-repository ppa:graphics-drivers/ppa -y && \
    add-apt-repository ppa:ubuntugis/ppa -y && \
    add-apt-repository ppa:flexiondotorg/nvtop -y && \
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
    # 安装gpg-agent
    apt-get install -y gpg-agent --no-install-recommends && \
    # 安装cuda keyring
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb && \
    dpkg -i cuda-keyring_1.0-1_all.deb && \
    rm cuda-keyring_1.0-1_all.deb && \
    # 安装cuda repo
    wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub && \
    add-apt-repository -y "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" && \
    # - apt-get upgrade is run to patch known vulnerabilities in apt-get packages as
    #   the ubuntu base image is rebuilt too seldom sometimes (less than once a month)
    apt-get update --yes && \
    apt-get upgrade --yes && \
    # 安装colab apt包
    apt-get install --yes --no-install-recommends \
    adduser apt apt-utils base-files base-passwd bash bsdutils \
    build-essential bzip2 ca-certificates clang clinfo cmake \
    coreutils \
    cuda-command-line-tools-11-8 cuda-compat-11-8 \
    cuda-cudart-11-8 cuda-cudart-dev-11-8 cuda-libraries-11-8 \
    cuda-libraries-dev-11-8 cuda-minimal-build-11-8 \
    cuda-nvml-dev-11-8 cuda-nvprof-11-8 cuda-nvtx-11-8 \
    curl dash debconf debianutils diffutils dirmngr dpkg \
    e2fsprogs fdisk ffmpeg file findutils fio \
    fonts-humor-sans fonts-liberation fuse \
    gcc-10-base gfortran git git-lfs gnupg2 \
    google-perftools gpgv graphviz grep gzip hostname \
    init-system-helpers kmod less libacl1 libapt-pkg-dev \
    libapt-pkg6.0 libasound2-dev libatlas-base-dev \
    libattr1 libaudit-common libaudit1 libavdevice58 \
    libblkid1 libblocksruntime-dev libboost-all-dev \
    libbz2-1.0 libc-bin libc6 libcap-ng0 libcom-err2 \
    libcrypt1 \
    libcublas-11-8 libcublas-dev-11-8 libcudnn8 libcudnn8-dev \
    libcurl4 libcurl4-openssl-dev \
    libcusparse-11-8 libcusparse-dev-11-8 \
    libdb5.3 libdebconfclient0 libegl1 libext2fs2 libfdisk1 \
    libffi7 libfreetype6-dev libgcc-s1 libgcrypt20 libgdal-dev \
    libgit2-dev libgl1 libgles2 libglvnd0 libgmp10 libgnutls30 \
    libgpg-error0 libhdf5-dev libhogweed5 libicu-dev libidn2-0 \
    libjack-dev liblapack-dev liblz4-1 liblzma5 libmount1 \
    libnccl-dev libnccl2 libncurses5-dev libncurses6 libncursesw5 \
    libncursesw6 libnettle7 libnpp-11-8 libnpp-dev-11-8 \
    libopenblas-dev libopencv-dev libopengl0 libopenmpi-dev \
    libp11-kit0 \
    libpam-modules libpam-modules-bin libpam-runtime libpam0g \
    libpcre2-8-0 libpcre3 libpng-dev libprocps8 libprotobuf-java \
    libpython3-dev libseccomp2 libselinux1 libsemanage-common \
    libsemanage1 libsepol1 libsm6 libsmartcols1 \
    libsndfile1 libsndfile1-dev libss2 libssl-dev libstdc++6 \
    libsystemd0 libtasn1-6 libtinfo5 libtinfo6 libturbojpeg \
    libudev1 libudunits2-0 libudunits2-dev libunistring2 \
    libuuid1 libwebpdemux2 libxext6 libxft-dev libxml2-dev \
    libxslt1.1 libzmq3-dev libzmq5 libzstd1 \
    linux-headers-generic \
    locales login logsave lsb-base lsof man-db manpages manpages-dev \
    manpages-posix manpages-posix-dev mawk moreutils mount \
    ncurses-base ncurses-bin nvidia-opencl-dev \
    openjdk-11-jdk-headless openssh-client p7zip-full passwd \
    perl-base pkg-config procps protobuf-compiler psmisc \
    python3.10 python3.10-dev python3.10-distutils python3.10-tk \
    qt5-default r-base r-base-core r-base-dev r-cran-devtools \
    r-cran-tidyverse rename rsync sed sensible-utils \
    sudo sysvinit-utils tar tcl-dev tcllib tk-dev tmux \
    ubuntu-keyring unrar unzip util-linux vim wget zip zlib1g \
    net-tools iftop iotop rsync tzdata \
    dnsutils openssh-server pv lshw pciutils nvtop python3.10-venv && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 && \
    sed -i s@/mirrors.tuna.tsinghua.edu.cn/@/archive.ubuntu.com/@g /etc/apt/sources.list && \
    # 清理apt
    apt-get clean && rm -rf /var/lib/apt/lists/*


    # 配置locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    # 配置时区
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone

    # 快速安装pip相关套件
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

    # 安装colab的python包
COPY requirements.txt /
    # 安装google-lab-1.0.0
ADD google-colab-1.0.0.tar.gz /usr/local/lib/python3.10/dist-packages/
    # 安装python-apt-0.0.0
ADD python-apt-0.0.0.tar.gz /
RUN cd /python-apt && pip install . && cd - && \
    # 配置python pip
    pip config set global.disable-pip-version-check 'True' && \
    pip config set global.extra-index-url 'https://us-python.pkg.dev/colab-wheels/public/simple/' && \
    pip install -r requirements.txt --no-deps && \
    # 安装jupyterlab, nvitop和envkernel
    pip install jupyterlab==3.6.3 ipywidgets jupyter-archive notebook && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension disable "@jupyterlab/apputils-extension:announcements" && \
    pip install jupyter-server-proxy && \
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

