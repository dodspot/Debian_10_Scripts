#!/bin/bash

# prequal update
apt-get -y -q update
apt-get -y -q upgrade

# install apps
apt-get -y -q install apt-transport-https
apt-get -y -q install ca-certificates 
apt-get -y -q install curl 
apt-get -y -q install gnupg2 
apt-get -y -q install software-properties-common

# add offizial Docker GPG
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# add Docker to aptitude sourcelist
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# update with new sourcelist
apt-get -y update

# check if Docker repository is used
apt-cache policy docker-ce

# Example output
#ocker-ce:
#  Installed: (none)
#  Candidate: 5:18.09.7~3-0~debian-buster
#  Version table:
#     5:18.09.7~3-0~debian-buster 500
#        500 https://download.docker.com/linux/debian buster/stable amd64 Packages

# install Docker
apt-get -y install docker-ce

# Check if Docker is running
systemctl status docker | head -n 3