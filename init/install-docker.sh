#!/bin/bash -ex

# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository

sudo apt-get update

sudo apt-get dist-upgrade -y

sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install -y docker-ce

sudo docker run -d --name nginx_80 -p 80:80 --restart unless-stopped nginx
