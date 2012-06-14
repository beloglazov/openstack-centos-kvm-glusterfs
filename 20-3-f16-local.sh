#!/bin/sh

virt-install --connect=qemu:///system --name=fedora-local --ram=1512 --vcpus=2 --disk /root/images/f16-x86_64-openstack-sda.qcow2,format=qcow2 --import --network bridge:br0
