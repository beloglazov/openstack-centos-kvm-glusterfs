#!/bin/sh

mkdir /kvm-storage
echo "compute1:/kvm-storage /kvm-storage nfs defaults,vers=3 0 0" >> /etc/fstab
mount -a
