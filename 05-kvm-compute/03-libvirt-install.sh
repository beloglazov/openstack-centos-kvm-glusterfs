#!/bin/sh

yum -y install libvirt libvirt-python python-virtinst avahi dmidecode

service messagebus restart
service avahi-daemon restart

chkconfig messagebus on
chkconfig avahi-daemon on
