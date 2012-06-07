#!/bin/sh

iptables -F
iptables -t nat -F
iptables -t mangle -F

iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 24007:24047 -j ACCEPT
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 111 -j ACCEPT
iptables -A INPUT -m state --state NEW -m udp -p udp --dport 111 -j ACCEPT

service iptables save
service iptables restart

