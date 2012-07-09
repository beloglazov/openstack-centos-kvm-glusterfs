#!/bin/sh

iptables -F

service iptables save
service iptables restart
