#!/bin/sh

iptables -F
iptables -t nat -F
iptables -t mangle -F

# MySQL server
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT
#iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT

service iptables save
service iptables restart
