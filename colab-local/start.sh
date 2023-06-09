#!/bin/bash

echo "pod started"

# move root to workspace
if [ ! -d "/workspace/.root" ]; then
    mv /root /workspace/
    mv /workspace/root /workspace/.root
else
    rm -r /root
fi
ln -s /workspace/.root /root


# move TMPDIR to workspace
if [ ! -d "/workspace/.tmp" ]; then
    mkdir -p /workspace/.tmp
fi
export TMPDIR=/workspace/.tmp

# move venv
if [ ! -d "/workspace/venv" ]; then
    mv /workspace-tmp/* /workspace/
fi
rm -r /workspace-tmp


if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi


if [[ $JUPYTER_PASSWORD ]]
then
    cd /
    jupyter lab --allow-root --no-browser --port=8888 --ip=* \
        --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' \
        --ServerApp.token=$JUPYTER_PASSWORD --ServerApp.allow_origin=* \
        --ServerApp.preferred_dir=/workspace
else
    sleep infinity
fi
