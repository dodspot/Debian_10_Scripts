#!/bin/bash

# read vars
read -p "Enter new instance SA password: " pass
read -p "Enter Port for SQL-instance: " port

# install image 
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$pass" -e "MSSQL_PID=Express" -p $port:$port -d mcr.microsoft.com/mssql/server:2017-latest-ubuntu 


# configure Firewall
ufw allow ${port}/tcp
echo y | ufw enable