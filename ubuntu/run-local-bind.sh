#WORKSPACE_VOL=runpod-basara-app-volume
docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp -p 7860:7860 \
	--storage-opt size=10G \
	-v "$(pwd)/workspace:/workspace" \
	runpod-cuda:11.8.0-cudnn8-devel-ubuntu22.04
#docker volume rm ${WORKSPACE_VOL}
