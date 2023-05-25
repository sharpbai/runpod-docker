#WORKSPACE_VOL=runpod-basara-app-volume
docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp -p 7860:7860 \
	--storage-opt size=10G \
	-v "$(pwd)/workspace:/workspace" \
	runpod-basaran:0.17.2
#docker volume rm ${WORKSPACE_VOL}
