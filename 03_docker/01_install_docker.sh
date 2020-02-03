#!/bin/bash

# Update and upgrade
apt-get -y update
apt-get -y upgrade

# Install Apps
apt-get -y install apt-transport-https
apt-get -y install ca-certificates 
apt-get -y install curl 
apt-get -y install gnupg2 
apt-get -y install software-properties-common
	
# Add librarys and repositorys
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	
# Make docker executable
chmod +x /usr/local/bin/docker-compose

# Update from docker
apt-get -y update

# Install docker
apt-get -y install docker-ce

# Finish
dialog --ascii-lines --msgbox "Docker installation completed" 0 0
clear
bash /git/Debian_10_Scripts/03_docker/index.sh