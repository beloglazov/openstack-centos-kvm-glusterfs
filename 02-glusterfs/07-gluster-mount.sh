#!/bin/sh

mkdir -p /var/lib/nova/instances
echo "compute1:/vm-instances /var/lib/nova/instances glusterfs defaults 0 0" >> /etc/fstab
mount -a
