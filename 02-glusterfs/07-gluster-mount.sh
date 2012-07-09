#!/bin/sh

# This should be run on all the hosts

mkdir -p /var/lib/nova/instances
echo "compute1:/vm-instances /var/lib/nova/instances glusterfs defaults 0 0" >> /etc/fstab
mount -a
