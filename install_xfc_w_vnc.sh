#!/bin/bash

# update and upgrade
apt-get -y update
apt-get -y upgrade

# install xfc4 desktop environment
apt-get -y install xfce4
apt-get -y install xfce4-goodies

# install vnc viewer
apt-get -y install tightvncserver

# install required fonts
apt-get -y install xfonts-base
apt-get -y install xfonts-100dpi
apt-get -y install xfonts-75dpi

# initiate vnc server
echo "Password must between six and eight characters"
vncserver

# stop vnc server
vncserver -kill :1

# backup vnc konfiguration
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

# create own konfig file
echo "#!/bin/bash" > ~/.vnc/xstartup
echo "xrdb $HOME/.Xresources" >>~/.vnc/xstartup
echo "startxfce4 &" >>~/.vnc/xstartup

# chmod own config file
chmod +x ~/.vnc/xstartup

# restart vncserver
vncserver