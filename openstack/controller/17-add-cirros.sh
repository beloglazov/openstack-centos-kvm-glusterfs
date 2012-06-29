#!/bin/sh

mkdir /tmp/images
cd /tmp/images
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img

glance add name="cirros-0.3.0-x86_64" is_public=true disk_format=qcow2 container_format=bare < cirros-0.3.0-x86_64-disk.img

rm -rf /tmp/images
