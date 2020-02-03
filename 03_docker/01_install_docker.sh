#!/bin/bash

# Update and upgrade
dialog --ascii-lines --gauge "Update" 0 0 8
apt-get -qq update

dialog --ascii-lines --gauge "Upgrade" 0 0 16
apt-get -qq upgrade

# Install Apps
dialog --ascii-lines --gauge "Install apt-transport-https" 0 0 24 
apt-get -qq install apt-transport-https

dialog --ascii-lines --gauge "Install ca-certificates" 0 0 32 
apt-get -qq install ca-certificates 

dialog --ascii-lines --gauge "Install curl" 0 0 40 
apt-get -qq install curl 

dialog --ascii-lines --gauge "Install gnupg2" 0 0 48 
apt-get -qq install gnupg2 

dialog --ascii-lines --gauge "Install software-properties-common" 0 0 56 
apt-get -qq install software-properties-common
	
# Add Librarys
dialog --ascii-lines --gauge "Add librarys" 0 0 64
curl --silent -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - 
curl --silent -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 

# Add repository
dialog --ascii-lines --gauge "" 0 0 72
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /dev/null 2>&1
	
# Make docker executable
dialog --ascii-lines --gauge "Make docker executable" 0 0 80
chmod +x /usr/local/bin/docker-compose

# Update from docker
dialog --ascii-lines --gauge "Update from docker" 0 0 88
apt-get -qq update

# Install docker
dialog --ascii-lines --gauge "Install docker" 0 0 96
apt-get -qq install docker-ce

# Finish
dialog --ascii-lines --msgbox "Docker installation completed" 0 0
clear
bash /git/Debian_10_Scripts/03_docker/index.sh