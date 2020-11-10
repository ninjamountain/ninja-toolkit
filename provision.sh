#!/bin/bash

set -e #stop on error
set -x #echo commands

curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

curl https://baltocdn.com/helm/signing.asc | apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list

apt-get update -y

apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common 
apt-get install -y openssh-server zip unzip jq ncdu net-tools xmlstarlet htop ioping iotop dnsutils cowsay curl wget dnsutils git build-essential
apt-get install -y packer
apt-get install -y terraform
apt-get install -y vault
apt-get install -y google-cloud-sdk
apt-get install -y kubectl
apt-get install -y ansible
apt-get install -y docker-ce
apt-get install -y helm

#Manual Steps (When logged into user account)
# terraform -install-autocomplete
# sudo usermod -aG docker $USER