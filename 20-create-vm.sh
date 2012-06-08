#!/bin/sh

virt-install --connect=qemu:///system --name=ubuntu-test --ram=1512 --vcpus=2 --disk /kvm-storage/precise-server-cloudimg-amd64-disk1.img,format=qcow2 --import --network bridge:br0
