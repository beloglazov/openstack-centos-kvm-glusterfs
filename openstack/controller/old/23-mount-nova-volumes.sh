#!/bin/sh

mkdir /var/lib/glance/images
echo "/dev/mapper/nova--volumes-lv--nova--volumes /var/lib/glance/images ext4 defaults 0 0" >> /etc/fstab
mount -a
