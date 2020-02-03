#!/bin/bash

# UPDATE ######################################################################
dialog --ascii-lines --mixedgauge "" 0 0 8 \
"Updates"                              "in progress" \
"Upgrade"                              "pending" \
"Install apt-transport-https"          "pending" \
"Install ca-certificates"              "pending" \
"Install curl"                         "pending" \
"Install gnupg2"                       "pending" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq update

# UPGRADE #####################################################################
dialog --ascii-lines --mixedgauge "" 0 0 16 \
"Updates"                              "completed" \
"Upgrade"                              "in progress" \
"Install apt-transport-https"          "pending" \
"Install ca-certificates"              "pending" \
"Install curl"                         "pending" \
"Install gnupg2"                       "pending" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq upgrade

# INSTALL APT-TRANSPORT-HTTPS #################################################
dialog --ascii-lines --mixedgauge "" 0 0 24 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "in progress" \
"Install ca-certificates"              "pending" \
"Install curl"                         "pending" \
"Install gnupg2"                       "pending" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq install apt-transport-https

# INSTALL CA-CERTIFICATES #####################################################
dialog --ascii-lines --mixedgauge "" 0 0 32 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "in progress" \
"Install curl"                         "pending" \
"Install gnupg2"                       "pending" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq install ca-certificates 

# INSTALL CURL ################################################################
dialog --ascii-lines --mixedgauge "" 0 0 40 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "in progress" \
"Install gnupg2"                       "pending" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq install curl 

# INSTALL GNUPG2 ##############################################################
dialog --ascii-lines --mixedgauge "" 0 0 48 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "in progress" \
"Install software-properties-common"   "pending" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq install gnupg2 

# INSTALL SOFTWARE-PROPERTIES-COMMON ##########################################
dialog --ascii-lines --mixedgauge "" 0 0 56 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "in progress" \
"Add librarys"                         "pending" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
apt-get -qq install software-properties-common
	
# ADD LIBRARYS ################################################################
dialog --ascii-lines --mixedgauge "" 0 0 64 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "completed" \
"Add librarys"                         "in progress" \
"Make Docker executable"               "pending" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
curl --silent -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - 
curl --silent -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
	
# MAKE DOCKER EXECUTABLE ######################################################
dialog --ascii-lines --mixedgauge "" 0 0 72 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "completed" \
"Add librarys"                         "completed" \
"Make Docker executable"               "in progress" \
"Add Docker-repository to sourcelist"  "pending" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
chmod +x /usr/local/bin/docker-compose

# ADD DOCKER-REPOSITORY TO SOURCE LIST ########################################
dialog --ascii-lines --mixedgauge "" 0 0 80 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "completed" \
"Add librarys"                         "completed" \
"Make Docker executable"               "completed" \
"Add Docker-repository to sourcelist"  "in progress" \
"Update from Docker"                   "pending" \
"Install Docker"                       "pending"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# UPDATE FROM DOCKER ##########################################################
dialog --ascii-lines --mixedgauge "" 0 0 88 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "completed" \
"Add librarys"                         "completed" \
"Make Docker executable"               "completed" \
"Add Docker-repository to sourcelist"  "completed" \
"Update from Docker"                   "in progress" \
"Install Docker"                       "pending"
apt-get -qq update

# INSTALL DOCKER ##############################################################
dialog --ascii-lines --mixedgauge "" 0 0 96 \
"Updates"                              "completed" \
"Upgrade"                              "completed" \
"Install apt-transport-https"          "completed" \
"Install ca-certificates"              "completed" \
"Install curl"                         "completed" \
"Install gnupg2"                       "completed" \
"Install software-properties-common"   "completed" \
"Add librarys"                         "completed" \
"Make Docker executable"               "completed" \
"Add Docker-repository to sourcelist"  "completed" \
"Update from Docker"                   "completed" \
"Install Docker"                       "in progress"
apt-get -qq install docker-ce

# FINISH ######################################################################
dialog --ascii-lines --msgbox "Docker installation completed" 0 0
clear
bash /git/Debian_10_Scripts/03_docker/index.sh