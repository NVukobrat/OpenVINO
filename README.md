# OpenVINO Docker
This repository explains how to run a pre-built version of Intel's OpenVINO CPU edition. Bellow is an explanation of how to run docker image and examples within it.

### Pull the image
Download pre-build docker image
```
docker pull nvukobrat/openvino-cpu
```

### Run image
Run regular image
```
docker run -it nvukobrat/openvino-cpu
```

Go to examples dir
```
cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
```

Run Image Classification example
```
./demo_squeezenet_download_convert_run.sh
```

### Run image with X enables
Run image with X enabled
```
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -it nvukobrat/openvino-cpu
```

Go to examples dir
```
cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
```

Run Inference Pipeline example
```
./demo_security_barrier_camera.sh
```

### Useful references
- [Official Intel OpenVINO guide](https://docs.openvinotoolkit.org/R5/_docs_install_guides_installing_openvino_docker.html)