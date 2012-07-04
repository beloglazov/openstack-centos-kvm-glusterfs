#!/bin/sh

service libvirtd restart
service openstack-nova-network restart
service openstack-nova-compute restart

chkconfig openstack-nova-network on
chkconfig openstack-nova-compute on

