WORKSPACE_VOL=runpod-torch-workspace-volume
docker volume create -d loopback ${WORKSPACE_VOL} -o sparse=true -o size=50g
docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp \
	--storage-opt size=10G \
	-v ${WORKSPACE_VOL}:/workspace \
	runpod/pytorch:3.10-2.0.1-120-devel
	#runpod-torch:2.0.1-cuda12.0.1-cudnn8-devel-ubuntu22.04
docker volume rm ${WORKSPACE_VOL}
