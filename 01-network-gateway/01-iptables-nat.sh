#!/bin/sh

# Flush the iptables rules. For production it is recommented to open
# the specifc required ports.
iptables -F
iptables -t nat -F
iptables -t mangle -F

# Set up packet forwarding for NAT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 
iptables -A FORWARD -i eth1 -j ACCEPT 
iptables -A FORWARD -o eth1 -j ACCEPT 

# Save the iptables configuration into a file and restart iptables
service iptables save
service iptables restart
