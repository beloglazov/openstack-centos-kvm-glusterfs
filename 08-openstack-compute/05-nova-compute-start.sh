#!/bin/sh

# Start the libvirt and Nova services
service libvirtd restart
service openstack-nova-compute restart
chkconfig openstack-nova-compute on

