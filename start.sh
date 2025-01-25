cd /workspace/ComfyUI
cp -r -u /workspace/importModels/* /workspace/ComfyUI/models
python -m jupyter notebook --NotebookApp.token=$JUPYTER_TOKEN --NotebookApp.ip='0.0.0.0' --port $JUPYTER_PORT --allow-root & 
python main.py --listen 0.0.0.0 --port $COMFYUI_PORT &
wait