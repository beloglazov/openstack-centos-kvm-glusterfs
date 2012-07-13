#!/bin/sh

chown -R root:nova /etc/nova
chown -R nova:nova /var/lib/nova
chmod 640 /etc/nova/nova.conf

chown -R nova:nova /var/cache/libvirt
chown -R nova:nova /var/run/libvirt
chown -R nova:nova /var/lib/libvirt

sed -i 's/#user = "root"/user = "nova"/g' /etc/libvirt/qemu.conf
sed -i 's/#group = "root"/group = "nova"/g' /etc/libvirt/qemu.conf
