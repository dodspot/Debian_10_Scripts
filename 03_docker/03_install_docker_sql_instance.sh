#!/bin/bash

# Update and upgrade
clear
apt-get -y update
apt-get -y upgrade

# Vars
clear
dialog --ascii-lines --passwordbox "Enter new instance SA password:" 0 0 > $pass
dialog --ascii-lines --passwordbox "Enter Port for SQL-instance:" 0 0 > $port
#read -p "Enter new instance SA password: " pass
#read -p "Enter Port for SQL-instance: " port

# install image 
clear
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$pass" -e "MSSQL_PID=Express" -p $port:$port -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu 

# configure Firewall
clear
ufw allow ${port}/tcp
echo y | ufw enable
	
# Finish
clear
dialog --ascii-lines --msgbox "Docker SQL instance installed" 0 0
bash /git/Debian_10_Scripts/03_docker/index.sh