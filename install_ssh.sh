#!/bin/bash

# VAR
# alternative rootusername
user=alterroot
# ssh port
port=22

# update and install software
apt-get -y update
apt-get -y upgrade
apt-get -y install unattended-upgrades
apt-get -y install ufw

# add alternative rootuser
adduser --disabled-password --gecos "" ${user}
usermod -aG sudo ${user}

# copy ssh-key for new user
cp -r ~/.ssh /home/${user}
chown -R ${user}:${user} /home/${user}/.ssh

# dchange sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port ${port}/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# clear password for sudo
echo "${user} ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo

# configure Firewall
ufw allow ${port}/tcp
echo y | ufw enable

# reboot
init 6
