#!/bin/sh

mkdir /tmp/images
cd /tmp/images
wget http://uec-images.ubuntu.com/precise/current/precise-server-cloudimg-amd64-disk1.img

glance add name="ubuntu" is_public=true disk_format=qcow2 container_format=bare < precise-server-cloudimg-amd64-disk1.img

rm -rf /tmp/images
