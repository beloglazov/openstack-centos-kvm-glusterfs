#!/bin/sh

yum install -y ntp
service ntpd start
chkconfig ntpd on
