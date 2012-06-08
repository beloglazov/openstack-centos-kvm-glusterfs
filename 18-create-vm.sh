#!/bin/sh

virt-install --connect=qemu:///system --name=ubuntu-test --ram=512 --vcpus=1 --disk=/kvm-storage/precise-server-cloudimg-amd64-disk1.img --import
