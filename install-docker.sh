#!/bin/bash

LOGFILE="/var/log/docker-install.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Starting Docker installation at $(date)" &>> $LOGFILE

# 1. Update existing packages
echo "Updating packages..."
sudo yum update -y &>> $LOGFILE

# 2. Install required packages
echo "Installing required packages..."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 &>> $LOGFILE

# 3. Add Docker repository
echo "Adding Docker repo..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &>> $LOGFILE

# 4. Install Docker Engine
echo "Installing Docker..."
sudo yum install -y docker-ce docker-ce-cli containerd.io &>> $LOGFILE

# 5. Start Docker service
echo "Starting Docker..."
sudo systemctl start docker &>> $LOGFILE

# 6. Enable Docker to start on boot
echo "Enabling Docker on boot..."
sudo systemctl enable docker &>> $LOGFILE

# 7. Verify Docker is installed and running
echo "Verifying Docker version..." 
docker --version &>> $LOGFILE

echo "Running hello-world container..."
sudo docker run hello-world &>> $LOGFILE

# Optional: Add user to docker group
echo "Adding user to docker group..."
sudo usermod -aG docker $USER &>> $LOGFILE

# Final success check
if [ $? -eq 0 ]; then
    echo "Docker installation completed successfully at $(date)" &>> $LOGFILE
else
    echo "Docker installation failed at $(date)" &>> $LOGFILE
fi

#sudo bash install-docker.sh
#cat /var/log/docker-install.log

