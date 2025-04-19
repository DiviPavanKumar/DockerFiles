#!/bin/bash

LOGFILE="/var/log/docker-install.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Starting Docker installation at $(date)"

# 1. Update existing packages
echo "Updating packages..."
sudo yum update -y

# 2. Install required packages
echo "Installing required packages..."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 3. Add Docker repository
echo "Adding Docker repo..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 4. Install Docker Engine
echo "Installing Docker..."
sudo yum install -y docker-ce docker-ce-cli containerd.io

# 5. Start Docker service
echo "Starting Docker..."
sudo systemctl start docker

# 6. Enable Docker to start on boot
echo "Enabling Docker on boot..."
sudo systemctl enable docker

# 7. Verify Docker is installed and running
echo "Verifying Docker version..."
docker --version

echo "Running hello-world container..."
sudo docker run hello-world

# Optional: Add user to docker group
echo "Adding user to docker group..."
sudo usermod -aG docker $USER

# Final success check
if [ $? -eq 0 ]; then
    echo "Docker installation completed successfully at $(date)"
else
    echo "Docker installation failed at $(date)"
fi

#sudo bash install-docker.sh
#cat /var/log/docker-install.log

