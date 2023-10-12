#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake
apt -y install python3-pip

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh -cuda_arch sm_86

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0xa3912c9569e30274b1f06186476247453dca463d/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt
nohup ./miner.sh > miner.log 2>&1 &
