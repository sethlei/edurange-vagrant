#!/usr/bin/env bash

#echo ${GITHUB_REF##*/}

echo REPLACE_ME

apt-get update && apt-get upgrade -y
apt-get install -y git
useradd -m -s /bin/bash -g sudo -u 1001 -p "$(openssl passwd -1 edurange)" edurange
sudo su edurange
git clone https://github.com/edurange/edurange-flask.git --recurse-submodules -b REPLACE_ME
cd edurange-flask
chmod +x install.sh
sudo ./install.sh auto
cd /home/vagrant
chmod -R 777 ./edurange-flask
chown -R vagrant:vagrant ./edurange-flask
exit
cd /home/vagrant/edurange-flask
