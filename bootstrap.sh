#!/usr/bin/env bash

apt-get update
apt-get install -y git
git clone -b autoinstall https://github.com/edurange/edurange-flask.git --recurse-submodules
cd edurange-flask
chmod +x install.sh
useradd -m -s /bin/bash -g sudo -u 1001 -p "$(openssl passwd -1 edurange)" edurange
sudo su edurange
sudo ./install.sh auto
