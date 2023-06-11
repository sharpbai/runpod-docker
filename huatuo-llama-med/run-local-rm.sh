WORKSPACE_VOL=runpod-huatuo_llama_med-volume
docker volume create -d loopback ${WORKSPACE_VOL} -o sparse=true -o size=50g
docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp \
	--storage-opt size=10G \
	-v ${WORKSPACE_VOL}:/workspace \
	runpod-huatuo_llama_med:1.0.0-cu118
docker volume rm ${WORKSPACE_VOL}
#-v "$(pwd)/workspace:/workspace"
#-u root:$(id -u sharpbai) \
