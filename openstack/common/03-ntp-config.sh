#!/bin/sh

sed -i 's/server 0.centos.pool.ntp.org//g' /etc/ntp.conf
sed -i 's/server 1.centos.pool.ntp.org//g' /etc/ntp.conf
sed -i 's/server 2.centos.pool.ntp.org//g' /etc/ntp.conf

cat ../config/ntp.conf >> /etc/ntp.conf
