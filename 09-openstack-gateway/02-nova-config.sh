#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT public_interface eth0
