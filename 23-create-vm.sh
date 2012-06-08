#!/bin/sh

virt-install --name centos --vcpus 2 --ram 1500 --disk path=/kvm-storage/centos.img,size=10 --network bridge:br0 --arch i686 --accelerate -c /kvm-storage/CentOS-6.2-i386-minimal.iso
