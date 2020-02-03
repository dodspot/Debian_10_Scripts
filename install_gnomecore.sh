#!/bin/bash

# update and upgrade
apt-get -y update
apt-get -y upgrade

# install xorg
apt-get -y install xorg
apt-get -y install xserver-xorg-core

# install gnome core
apt-get install gnome-core