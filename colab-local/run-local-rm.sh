WORKSPACE_VOL=colab-workspace-volume
GOOGLE_DRIVE_VOL=./google-drive-vol
docker volume create -d loopback ${WORKSPACE_VOL} -o sparse=true -o size=50g
docker run -it --rm \
	--runtime=nvidia --gpus all  \
	--env-file .env \
	-p 220:22/tcp -p 8888:8888/tcp \
	--storage-opt size=100G \
	-v ${WORKSPACE_VOL}:/workspace \
	-v ${GOOGLE_DRIVE_VOL}:/content/drive \
	colab-local:cuda118-ubuntu2004
docker volume rm ${WORKSPACE_VOL}
