#!/bin/bash

# prequal update
apt-get -qq update
apt-get -qq upgrade

# install docker image

docker pull wordpress