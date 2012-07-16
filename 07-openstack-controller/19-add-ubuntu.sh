#!/bin/sh

# Download an Ubuntu Cloud image
mkdir /tmp/images
cd /tmp/images
wget http://uec-images.ubuntu.com/precise/current/precise-server-cloudimg-amd64-disk1.img

# Add the downloaded image to Glance
glance add name="ubuntu" is_public=true disk_format=qcow2 container_format=bare < precise-server-cloudimg-amd64-disk1.img

# Remove the temporary directory
rm -rf /tmp/images
