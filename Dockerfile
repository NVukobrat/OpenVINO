FROM ubuntu:16.04

# Set arguments
ARG DOWNLOAD_LINK=http://registrationcenter-download.intel.com/akdlm/irc_nas/15078/l_openvino_toolkit_p_2018.5.455.tgz
ARG INSTALL_DIR=/opt/intel/computer_vision_sdk
ARG TEMP_DIR=/tmp/openvino_installer

# Update and install initial dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    cpio \
    sudo \
    lsb-release && \
    rm -rf /var/lib/apt/lists/*

# Download and install OpenVINO
RUN mkdir -p $TEMP_DIR && cd $TEMP_DIR && \
    wget -c $DOWNLOAD_LINK && \
    tar xf l_openvino_toolkit*.tgz && \
    cd l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh -s silent.cfg && \
    rm -rf $TEMP_DIR

# Install OpenVINO dependencies
RUN $INSTALL_DIR/install_dependencies/install_cv_sdk_dependencies.sh

# Build OpenVINO examples
RUN mkdir $INSTALL_DIR/deployment_tools/inference_engine/samples/build && cd $INSTALL_DIR/deployment_tools/inference_engine/samples/build && \
    /bin/bash -c "source $INSTALL_DIR/bin/setupvars.sh && cmake .. && make -j1"

# Compile examples
RUN /opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/inference_engine/samples/build_samples.sh

# Export libraries
RUN export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/openvx/lib:$LD_LIBRARY_PATH
RUN export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/inference_engine/lib/ubuntu_18.04/intel64:$LD_LIBRARY_PATH
RUN export LD_LIBRARY_PATH=/opt/intel/computer_vision_sdk_2018.5.455/deployment_tools/inference_engine/external/mkltiny_lnx/lib:$LD_LIBRARY_PATH
