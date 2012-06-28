#!/bin/sh

mkdir /tmp/images
cd /tmp/images
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img

glance add name="cirros-0.3-x86_64" is_public=true disk_format=qcow2 container_format=bare < cirros-0.3.0-x86_64-disk.img
#glance --os_username=$OS_USERNAME --os_password=$OS_PASSWORD --os_tenant=$OS_TENANT_NAME --os_auth_url=$OS_AUTH_URL add name="tty-linux-ramdisk" disk_format=ari container_format=ari < ttylinux-uec-amd64-12.1_2.6.35-22_1-loader

rm -rf /tmp/images
