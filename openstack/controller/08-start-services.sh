#!/bin/sh

service openstack-nova-api start
service openstack-nova-objectstore start
service openstack-nova-compute start
service openstack-nova-network start
service openstack-nova-volume start
service openstack-nova-scheduler start
service openstack-nova-cert start

chkconfig openstack-nova-api on
chkconfig openstack-nova-objectstore on
chkconfig openstack-nova-compute on
chkconfig openstack-nova-network on
chkconfig openstack-nova-volume on
chkconfig openstack-nova-scheduler on
chkconfig openstack-nova-cert on
