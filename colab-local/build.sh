docker build \
-t colab-local:cuda118-ubuntu2004 \
-t $(whoami)/colab-local:cuda118-ubuntu2004 \
-t colab-local:latest \
-t $(whoami)/colab-local:latest .