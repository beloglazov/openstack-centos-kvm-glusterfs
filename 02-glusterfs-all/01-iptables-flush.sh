#!/bin/sh

# This should be run on all the hosts

iptables -F

service iptables save
service iptables restart
