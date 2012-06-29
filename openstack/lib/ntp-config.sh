#!/bin/sh

SERVER1=`cat ../config/ntp.conf | sed '1!d;q'`
SERVER2=`cat ../config/ntp.conf | sed '2!d;q'`
SERVER3=`cat ../config/ntp.conf | sed '3!d;q'`

sed -i "s/server 0.*pool.ntp.org/$SERVER1/g" /etc/ntp.conf
sed -i "s/server 1.*pool.ntp.org/$SERVER2/g" /etc/ntp.conf
sed -i "s/server 2.*pool.ntp.org/$SERVER3/g" /etc/ntp.conf
