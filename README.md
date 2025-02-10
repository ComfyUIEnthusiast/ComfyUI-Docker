# Docker_ComfyUI-Jupyter
This docker container is used to run a ComfyUI instance in a docker container.

Please make sure to install drivers, configure your environment, and confirm you can access your graphics card from your container:
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

For windows, you can set up a Windows Subsystem Linux environment for docker containers by running:

    wsl --install

To build the docker container:

    docker compose build

To run the container (-d in detached mode):

    docker compose run -d
