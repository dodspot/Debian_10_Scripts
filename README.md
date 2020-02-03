# Debian_10_Scripts

# requirements
- Debian 10
- root login

# Init setup
- apt-get -qq update
- apt-get -qq upgrade
- apt-get -qq install git
- mkdir /git
- cd /git/
- git clone https://github.com/dodspot/Debian_10_Scripts/
- chmod -R 110 /git/Debian_10_Scripts/
- echo "*/10 * * * * root /git/Debian_10_Scripts/02_update_git.sh" >> /etc/crontab
