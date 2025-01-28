# syntax=docker/dockerfile:1
FROM pytorch/pytorch as base
USER root
#Set the timezone so installs don't ask for it
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

#install python, pip, and git
RUN apt-get update
RUN apt-get install -y git 
RUN apt-get install -y git-lfs ffmpeg libglu1-mesa-dev
RUN apt-get install -y sudo

#clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI

#makes future installations faster
RUN --mount=type=cache,target=/root/.cache/pip

#Make a python venv and install NVIDIA dependencies
RUN python3 -m venv /workspace/comfyenv
ENV PATH="/workspace/comfyenv/bin:$PATH"
ADD requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /workspace/ComfyUI
RUN pip install -r requirements.txt


FROM base as stage1
ENV COMFYUI_PORT=$COMFYUI_PORT
ENV JUPYTER_PORT=$JUPYTER_PORT
ENV JUPYTER_TOKEN=$JUPYTER_TOKEN
ADD start.sh ./
ADD extra_model_paths.yaml ./
CMD ["sh", "./start.sh"]