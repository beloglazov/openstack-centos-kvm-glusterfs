#!/bin/sh

# Download the Cirros VM image
mkdir /tmp/images
cd /tmp/images
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img

# Add the downloaded image to Glance
glance add name="cirros-0.3.0-x86_64" is_public=true disk_format=qcow2 container_format=bare < cirros-0.3.0-x86_64-disk.img

# Remove the temporary directory
rm -rf /tmp/images
