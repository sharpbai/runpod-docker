docker volume create -d loopback ${WORKSPACE_VOL} -o sparse=true -o size=50g
docker run -it --rm \
        --runtime=nvidia --gpus all  \
        --env-file .env \
        -p 220:22/tcp -p 8888:8888/tcp \
        --storage-opt size=10G \
        -v ./workspace:/workspace \
        runpod-huatuo_llama_med:1.0.0-cu118
