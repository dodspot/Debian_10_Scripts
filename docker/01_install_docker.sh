#!/bin/bash

# UPDATE
	apt-get -qq update
	apt-get -qq upgrade

# INSTALL
	apt-get -qq install apt-transport-https
	apt-get -qq install ca-certificates 
	apt-get -qq install curl 
	apt-get -qq install gnupg2 
	apt-get -qq install software-properties-common

# VARS

# SETUP
	
  # add librarys
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
	curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	
  # make docker-compase executable
	chmod +x /usr/local/bin/docker-compose

  # add Docker to aptitude sourcelist
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

  # update with new sourcelist
	apt-get -qq update

  # install Docker
	apt-get -qq install docker-ce

 # Check if Docker is running
	systemctl status docker | head -n 3