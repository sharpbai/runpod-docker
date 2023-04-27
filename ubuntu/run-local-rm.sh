docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp \
	--storage-opt size=10G \
	--mount type=bind,source="$(pwd)/workspace",target=/workspace \
	runpod-cuda:11.7.1-cudnn8-devel-ubuntu22.04
