#!/bin/sh

service libvirtd restart
service openstack-nova-compute restart
chkconfig openstack-nova-compute on

