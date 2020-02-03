#!/bin/bash

# UPDATE
	apt-get -qq update
	apt-get -qq upgrade

# INSTALL

# VARS
	read -p "Enter port for wordpress: " port
	read -p "Enter pass for wordpress database: " wordpass
	read -p "Enter pass for sql root user: " rootpass

# SETUP

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
	echo"      - ${port}:${port}"			>> docker.compose.yml
	echo"    environment:"				>> docker.compose.yml
	echo"      WORDPRESS_DB_PASSWORD: ${wordpass}"	>> docker.compose.yml
	echo""						>> docker.compose.yml
	echo"  mysql:"					>> docker.compose.yml
	echo"    image: mysql:5.7"			>> docker.compose.yml
	echo"    restart: always"			>> docker.compose.yml
	echo"    environment:"				>> docker.compose.yml
	echo"      MYSQL_ROOT_PASSWORD: ${rootpass}"	>> docker.compose.yml

  # start docker-compose
	docker-compose up -d

  # open Firewall port
	ufw allow ${port}

  # goto home
	cd ~