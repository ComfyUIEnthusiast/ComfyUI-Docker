# Docker_ComfyUI-Jupyter
This docker container is used to run a ComfyUI instance in a docker container.

## Step 1
Please make sure to install drivers, configure your environment, and confirm you can access your graphics card from your container:
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

For windows, you can set up a Windows Subsystem Linux environment for docker containers by running:

    wsl --install
## Step 2:
Create a file called .env and set your 3 variables needed. My default recommendation is:
```
COMFYUI_PORT=8188
JUPYTER_PORT=8888
JUPYTER_TOKEN=
```
## Step 3:
To build the docker container:

    docker compose build

## Step 4:
Add any models you want to be copied into the docker volumes into their appropriate directory of the importModels folder

## Step 5:
Run the container (-d in detached mode):

    docker compose run -d
    
If you have large models to copy over, it may take a few minutes to copy over. This should only occur once, and any other future restarts will not need to re-copy those models over again.

## Step 6:
Access your ComfyUI instance at the .env file's designated port, and you jupyter instance at the jupyter port
