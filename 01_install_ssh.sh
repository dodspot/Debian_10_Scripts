#!/bin/bash

# UPDATE
	apt-get -qq update
	apt-get -qq upgrade
	apt-get -qq autoremove

# INSTALL
	apt-get -qq install unattended-upgrades
	apt-get -qq install ufw
	apt-get -qq install apt-listchanges 
	apt-get -qq install vim 
	apt-get -qq install openssh-server

# VARS
	read -p "Enter username for alternative root account: " user
	read -p "Enter new ssh port: " port
	read -p "Enter public key from putty: " key
	
# SETUP

  # install key for root
  	cd ~
	mkdir .ssh
	${key} > authorized_keys
	chmod 0700 ~/.ssh -R

  # add alternative rootuser
	adduser --disabled-password --gecos "" ${user}
	usermod -aG sudo ${user}

  # copy ssh-key for new user
	cp -r /root/.ssh /home/${user}
	chown -R ${user}:${user} /home/${user}/.ssh

  # change sshd_config
	sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
	sed -i "s/#Port 22/Port ${port}/" /etc/ssh/sshd_config
	sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

  # clear password for sudo
	echo "${user} ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo

  # configure Firewall
	ufw allow ${port}/tcp
	echo y | ufw enable

  # reboot
	init 6
