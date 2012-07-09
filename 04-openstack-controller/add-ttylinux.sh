#!/bin/sh

mkdir /tmp/images
cd /tmp/images
wget http://smoser.brickies.net/ubuntu/ttylinux-uec/ttylinux-uec-amd64-12.1_2.6.35-22_1.tar.gz
tar -zxvf ttylinux-uec-amd64-12.1_2.6.35-22_1.tar.gz

glance --os_username=$OS_USERNAME --os_password=$OS_PASSWORD --os_tenant=$OS_TENANT_NAME --os_auth_url=$OS_AUTH_URL add name="tty-linux-kernel" disk_format=aki container_format=aki < ttylinux-uec-amd64-12.1_2.6.35-22_1-vmlinuz

glance --os_username=$OS_USERNAME --os_password=$OS_PASSWORD --os_tenant=$OS_TENANT_NAME --os_auth_url=$OS_AUTH_URL add name="tty-linux-ramdisk" disk_format=ari container_format=ari < ttylinux-uec-amd64-12.1_2.6.35-22_1-loader

RAMDISK_ID=`glance index |grep tty-linux-ramdisk| cut -d' ' -f1`
KERNEL_ID=`glance index |grep tty-linux-kernel| cut -d' ' -f1`

glance --os_username=$OS_USERNAME --os_password=$OS_PASSWORD --os_tenant=$OS_TENANT_NAME --os_auth_url=$OS_AUTH_URL add name="tty-linux" disk_format=ami container_format=ami kernel_id=$KERNEL_ID ramdisk_id=$RAMDISK_ID < ttylinux-uec-amd64-12.1_2.6.35-22_1.img

rm -rf /tmp/images
