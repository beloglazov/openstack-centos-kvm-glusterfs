#!/bin/sh

sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf 

service network restart

# TODO: update /etc/sysconfig/network-scripts/ifcfg-eth0 and etc.
