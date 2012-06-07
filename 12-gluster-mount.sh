#!/bin/sh

mkdir /kvm-storage
echo "ibm1:/kvm-storage /kvm-storage glusterfs defaults 0 0" >> /etc/fstab
mount -a
