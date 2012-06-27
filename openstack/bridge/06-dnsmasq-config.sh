#!/bin/sh

echo "
interface=eth1
dhcp-range=192.168.0.20,192.168.0.254
dhcp-host=00:21:5E:6D:57:EC,compute1,192.168.0.1
dhcp-host=00:21:5E:6D:5A:C0,compute2,192.168.0.2
dhcp-host=00:21:5E:6D:59:3A,compute3,192.168.0.3
#dhcp-host=,compute4,192.168.0.4
dhcp-host=00:18:8B:24:82:19,controller,192.168.0.5
dhcp-host=00:18:8B:24:D9:98,opennebula,192.168.0.6
server=128.250.66.5
server=128.250.201.5
" >> /etc/dnsmasq.conf
