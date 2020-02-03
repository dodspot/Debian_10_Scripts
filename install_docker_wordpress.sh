#!/bin/bash

# prequal update
apt-get -qq update
apt-get -qq upgrade

# create wordpress directory
mkdir /wordpress
cd /wordpress

# create docker-compose file
echo"version: '3.1'" 				>  docker.compose.yml
echo""						>> docker.compose.yml
echo"services:"					>> docker.compose.yml
echo"						>> docker.compose.yml
echo"  wordpress:"				>> docker.compose.yml
echo"    image: wordpress"			>> docker.compose.yml
echo"    restart: always"			>> docker.compose.yml
echo"    ports:"				>> docker.compose.yml
echo"      - 8080:80"				>> docker.compose.yml
echo"    environment:"				>> docker.compose.yml
echo"      WORDPRESS_DB_PASSWORD: example"	>> docker.compose.yml
echo""						>> docker.compose.yml
echo"  mysql:"					>> docker.compose.yml
echo"    image: mysql:5.7"			>> docker.compose.yml
echo"    restart: always"			>> docker.compose.yml
echo"    environment:"				>> docker.compose.yml
echo"      MYSQL_ROOT_PASSWORD: example"	>> docker.compose.yml

# start docker-compose
docker-compose up -d

# open Firewall port
ufw allow 8080

# goto root
cd ~