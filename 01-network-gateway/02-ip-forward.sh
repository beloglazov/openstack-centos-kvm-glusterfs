#!/bin/sh

# Enable IP forwarding
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf 

service network restart
