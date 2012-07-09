#!/bin/sh

virt-install --connect=qemu:///system --name=cirros --ram=1512 --vcpus=2 --disk /kvm-storage/cirros-0.3.0-x86_64-disk.img,format=qcow2 --import --network bridge=br0
