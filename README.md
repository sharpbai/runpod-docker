runpod-docker
====================
## 简介

这是一个为方便在runpod上进行训练而创建的一组基础docker镜像,全部包含jupyter和ssh,符合runpod标准的镜像结构

目前包含以下镜像
- cuda基础镜像 [runpod-cuda](https://hub.docker.com/repository/docker/sharpbai/runpod-cuda/general)
- torch基础镜像 [runpod-torch](https://hub.docker.com/repository/docker/sharpbai/runpod-torch/general)
- kohya_ss应用镜像 [runpod-kohya_ss](https://hub.docker.com/repository/docker/sharpbai/runpod-kohya_ss/general)
- colab环境本地镜像 [colab-local](https://hub.docker.com/repository/docker/sharpbai/colab-local/general)

> basaran应用镜像不推荐使用

## 使用方法

### 依赖项

首先安装 [docker-volume-loopback](https://github.com/ashald/docker-volume-loopback) 这个容器容量管理工具,可以参照[这个教程](https://blog.sharpbai.com/2023/04/%e8%a7%a3%e5%86%b3docker%e6%97%a0%e6%b3%95%e9%99%90%e5%88%b6%e5%8d%b7%e5%ae%b9%e9%87%8f%e9%97%ae%e9%a2%98/)

### 本地验证

这里以kohya_ss为例,其他镜像完全相同
首先在子目录中添加`.env`文件,格式如下

```plain
PUBLIC_KEY=ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxxxxx xxx@xxx.xx
JUPYTER_PASSWORD=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
```
然后在本地执行`run-local-rm.sh`或`run-local-bind.sh`,直接在本地启动镜像
推荐在vscode中执行

接下来

- 打开目标IP的8888端口,使用`JUPYTER_PASSWORD`可以直接登录jupyterlab
- 使用ssh配置好pubkey,使用`PUBLIC_KEY`可以直接登录ssh

最后在jupyterlab的控制台中打开一个终端

- 运行`activate_venv`,一键进入venv环境
- 运行`activate_app`,一键启动kohya_ss应用

然后可以在对应的7860端口访问kohya_ss的webui,预留了7861端口用于tensorboard的webui

## 备注

- 为适应runpod分为挂载系统卷和数据卷的特点,本镜像设计了一套在数据卷中的venv,在容器首次启动后,venv自动拷贝到数据卷,方便随时关闭镜像,且无损保留所有数据
- 为解决下载巨大模型时系统卷空间不够的问题,本镜像在容器启动后自动将TMP目录映射到了数据卷
- jupyterlab中的venv kernel是使用virtualenv创建的,在jupyter运行时可以保证环境变量完全跟随venv的shell环境,方便使用
- 推荐使用vscode的工作流,使用ssh+PUBKEY连接到容器,获得接近本地的使用体验

## runpod运行

在runpod上,需要创建一个自定义模板,
- 将镜像的地址填入
- 推荐系统卷容量10GB
- 推荐数据卷容量60GB
- 数据卷挂载位置选择`/workspace`

在环境变量处,填入`JUPYTER_PASSWORD`的键值,方便启动时直接使用预设的密码.PUBKEY无需填写,在runpod内预设的PUBKEY会自动注入.

## 镜像自定义

在Dockerfile中,如果有关于python的构建工作,请放到我`Start add cmd in venv`注释和`End add cmd in venv`,中间的部分,以保证在venv中可以正常使用
