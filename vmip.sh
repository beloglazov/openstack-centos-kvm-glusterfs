#!/bin/sh

#ping -b -c1 -w1 192.168.0.255 > /dev/null 2>&1
nmap -sT -PN -T5 -p22 192.168.0.0/24 > /dev/null 2>&1
arp | grep `virsh dumpxml $1 | grep "mac address" | cut -d \' -f2` | cut -d ' ' -f1
