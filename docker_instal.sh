#!/bin/bash

# 1. Update existing packages
sudo yum update -y

# 2. Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 3. Add Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 4. Install Docker Engine
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 5. Start Docker service
sudo systemctl start docker

# 6. Enable Docker to start on boot
sudo systemctl enable docker

# 7. Verify Docker is installed and running
docker --version
sudo docker run hello-world

sudo usermod -aG docker $USER
# Log out and back in for the group change to take effect