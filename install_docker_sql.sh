#!/bin/bash

# prequal update
apt-get -y -q update
apt-get -y -q upgrade

# install docker image

docker pull mcr.microsoft.com/mssql/server