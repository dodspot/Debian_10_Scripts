# Debian_10_Scripts

# requirements
- Debian 10
- root login

# Init setup
- apt-get -y update
- apt-get -y upgrade
- apt-get -y install git
- cd /git/
- git clone https://github.com/dodspot/Debian_10_Scripts/
- chmod -R 110 /git/Debian_10_Scripts/
- echo "*/10 * * * * root /git/Debian_10_Scripts/update_git.sh" >> /etc/crontab
