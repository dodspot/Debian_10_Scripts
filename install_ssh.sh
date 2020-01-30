#!/bin/bash

# requirements:
# root user got an installed ssh-key

# VAR
read -p "Enter username for alternative root account: " user
read -p "Enter new ssh port: " port

# update and install software
apt-get -y update
apt-get -y upgrade
apt-get -y install unattended-upgrades
apt-get -y install ufw

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
