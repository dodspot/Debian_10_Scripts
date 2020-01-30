# AKTUALIESIEREN

apt-get updates
apt-get upgrades

# USER ANLEGEN

adduser --disabled-password --gecos "" ndodson
usermod -aG sudo ndodson

# FIREWALL EINRICHTEN

apt-get install ufw
ufw allow OpenSSH
echo y | ufw enable

# SSH EINRICHTEN

cp -r ~/.ssh /home/ndodson
chown -R ndodson:ndodson /home/ndodson/.ssh

# DOCKER INSTALLIEREN
apt-get -y install apt-transport-https 
apt-get -y install ca-certificates 
apt-get -y install curl 
apt-get -y install gnupg2 
apt-get -y install software-properties-common

# GPG-SCHLÜSSEL HINZUFÜGEN

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# DOCKER REPOSITORY HINZUFÜGEN

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-cache policy docker-ce

# DOCKER CE INSTALLIEREN

apt install docker-ce
usermod -aG docker ndodson
