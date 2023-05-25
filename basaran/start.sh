#!/bin/bash

echo "pod started"

# move cache to workspace
rm -r /root/.cache
if [ ! -d "/app/.cache" ]; then
    mkdir -p /app/.cache
fi
ln -s /app/.cache /root/

if [ ! -d "/app/venv" ]; then
    python -m venv venv
    pip install ipykernel
    python -m ipykernel install --user --name venv --display-name "Python (venv)"
fi



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
    jupyter lab --allow-root --no-browser --port=8888 --ip=* --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token=$JUPYTER_PASSWORD --ServerApp.allow_origin=* --ServerApp.preferred_dir=/app
else
    sleep infinity
fi
