#!/bin/bash

# Update and upgrade
clear
apt-get -y update
apt-get -y upgrade

# install docker image
clear
docker pull mcr.microsoft.com/mssql/server

# Finish
clear
dialog --ascii-lines --msgbox "MSSQL is installed on Docker" 0 0
bash /git/Debian_10_Scripts/03_docker/index.sh