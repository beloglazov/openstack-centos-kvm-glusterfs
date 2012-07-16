#!/bin/sh

# Start the libvirt service
service libvirtd restart
chkconfig libvirtd on
