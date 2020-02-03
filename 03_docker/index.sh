#!/bin/bash

choose=`dialog --ascii-lines --backtitle "Dodspot Script Database - Docker" --menu "Select option:" 0 0 0 \
"1" "Install Docker" \
"2" "Install MSSQL for Docker" \
"3" "Install an MSSQL instance (reguires 2)" \
"4" "Install Wordpress on Docker" \
3>&1 1>&2 2>&3`

clear
echo "$choose"

case "$choose" in
        1) bash /git/Debian_10_Scripts/03_docker/01_install_docker.sh			;;
        2) bash /git/Debian_10_Scripts/03_docker/02_install_docker_sql.sh		;;
        3) bash /git/Debian_10_Scripts/03_docker/03_install_docker_sql_instance.sh	;;
	4) bash /git/Debian_10_Scripts/03_docker/04_install_docker_wordpress.sh		;;										;;
esac