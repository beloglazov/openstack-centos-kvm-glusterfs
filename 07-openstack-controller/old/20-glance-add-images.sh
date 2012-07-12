#!/bin/sh

#glance add name=centos is_public=true disk_format=qcow2 container_format=ovf copy_from=/kvm-storage/centos.img
glance add name=centos is_public=true disk_format=qcow2 container_format=ovf < /kvm-storage/centos.img
#glance add name=fedora is_public=true disk_format=qcow2 container_format=ovf < /kvm-storage/f16-x86_64-openstack-sda.qcow2

