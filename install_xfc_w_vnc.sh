#!/bin/bash

# update and upgrade
apt-get -y update
apt-get -y -q upgrade

# install xfc4 desktop environment
apt-get -y -q install xfce4
apt-get -y -q install xfce4-goodies

# install vnc viewer
apt-get -y -q install tightvncserver

# install required fonts
apt-get -y -q install xfonts-base
apt-get -y -q install xfonts-100dpi
apt-get -y -q install xfonts-75dpi

# initiate vnc server
echo "Password must between six and eight characters"
vncserver

# stop vnc server
vncserver -kill :1

# backup vnc konfiguration
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

# create own konfig file
echo '#!/bin/bash' 			> ~/.vnc/xstartup
echo 'unset SESSION_MANAGER' 		>>~/.vnc/xstartup
echo 'unset DBUS_SESSION_BUS_ADDRESS' 	>>~/.vnc/xstartup
echo 'xrdb $HOME/.Xresources' 		>>~/.vnc/xstartup
echo 'startxfce4 &' 			>>~/.vnc/xstartup

# chmod own config file
chmod +x ~/.vnc/xstartup

# restart vncserver
vncserver
