#!/bin/bash

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli contained.io docker-compose-plugin
systemctl start docker
docker run hello-world
yum install wget
wget https://archive.cloudera.com/hwx-sandbox/hdp/hdp-3.0.1/HDP_3.0.1_docker-deployscripts_18120587fc7fb.zip

yum install -y zip unzip

sh docker-deploy-hdp30.sh