#!/bin/sh

mkdir /kvm-storage
echo "localhost:/kvm-storage /kvm-storage glusterfs defaults 0 0" >> /etc/fstab
mount -a
