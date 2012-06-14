#!/bin/sh

iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 49152:49216 -j ACCEPT

service iptables save
service iptables restart

