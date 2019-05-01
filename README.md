# OpenVINO Docker
This repository explains how to run a pre-built version of Intel's OpenVINO CPU edition. Bellow is an explanation of how to run docker image and examples within it.

### Pull the image
Download pre-build docker image
```bash
docker pull nvukobrat/openvino-cpu
```

### Run image
Run regular image
```bash
docker run -it nvukobrat/openvino-cpu
```

Go to examples dir
```bash
cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
```

Run Image Classification example
```bash
./demo_squeezenet_download_convert_run.sh
```

### Run image with X enables
Run image with X enabled
```bash
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -it nvukobrat/openvino-cpu
```

Go to examples dir
```bash
cd /opt/intel/computer_vision_sdk/deployment_tools/demo/
```

Run Inference Pipeline example
```bash
./demo_security_barrier_camera.sh
```

### Run pre-built intel models
Model binaries path
```bash
/root/inference_engine_samples_build/intel64/Release/
```

Weight binaries path
```bash
/opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/intel_models/
```

Run example
```bash
/root/inference_engine_samples_build/intel64/Release/human_pose_estimation_demo -i /tmp/segment_20170705151058_4322496_10_25.ts -m /opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/intel_models/human-pose-estimation-0001/FP32/human-pose-estimation-0001.xml -d CPU
```


### In case some libraries are missing
```bash
export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/openvx/lib:$LD_LIBRARY_PATH
```

```bash
export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/inference_engine/lib/ubuntu_18.04/intel64:$LD_LIBRARY_PATH
```

```bash
export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/inference_engine/external/mkltiny_lnx/lib:$LD_LIBRARY_PATH
```

### Useful references
- [Official Intel OpenVINO guide](https://docs.openvinotoolkit.org/R5/_docs_install_guides_installing_openvino_docker.html)
