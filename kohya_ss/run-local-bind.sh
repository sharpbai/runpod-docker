WORKSPACE_VOL=runpod-kohya_ss-volume
docker volume create -d loopback ${WORKSPACE_VOL} -o sparse=true -o size=50g
docker run -it --rm \
        --runtime=nvidia --gpus all  \
        --env-file .env \
        -p 220:22/tcp -p 8888:8888/tcp -p 7860:7860 \
        --storage-opt size=10G \
        -v ${WORKSPACE_VOL}:/workspace \
        runpod-kohya_ss:21.5.10 
#docker volume rm ${WORKSPACE_VOL}
