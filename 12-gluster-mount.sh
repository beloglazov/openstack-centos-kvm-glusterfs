#!/bin/sh

mkdir kvm-storage
mount -t glusterfs ibm1:/kvm-storage /kvm-storage
