#!/bin/bash
# install docker https://docs.docker.com/engine/install/ubuntu/
# remove any old versions:
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
 sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker official GPG key:
 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

# Add user group for docker and add user to that group so docker can be used without sudo prefix each time https://docs.docker.com/engine/install/linux-postinstall/
 sudo groupadd docker
 sudo usermod -aG docker $USER
 newgrp docker
#  Test Install
#   docker run hello-world