#!/bin/sh

# Install libvirt and its dependecies
yum -y install libvirt libvirt-python python-virtinst avahi dmidecode

# Start the services required by livirt
service messagebus restart
service avahi-daemon restart

# Start the service during the system startup
chkconfig messagebus on
chkconfig avahi-daemon on
