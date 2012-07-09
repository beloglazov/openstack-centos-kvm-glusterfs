#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT libvirt_inject_partition -1
