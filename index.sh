#!/bin/bash

clear

echo "01 Install SSH"
echo "02 Update git directory"
echo "03 docker options"
echo "other number for exit"


read -p "Enter number of option: " choose

case "$choose" in
        1|01) bash /git/Debain_10_Scripts/01_install_ssh.sh
              ;;
        2|02) bash /git/Debain_10_Scripts/02_update_git.sh
              ;;
        3|03) bash /git/Debain_10_Scripts/03_docker/index.sh
              ;;
