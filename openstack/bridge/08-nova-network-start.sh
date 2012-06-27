#!/bin/sh

service openstack-nova-network start
#service openstack-nova-compute start

chkconfig openstack-nova-network on
#chkconfig openstack-nova-compute on

