#!/bin/sh

virt-install --connect=qemu:///system --name=ttylinux --ram=1512 --vcpus=2 --disk /kvm-storage/ttylinux.img --import --network bridge=br0
