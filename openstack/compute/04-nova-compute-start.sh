#!/bin/sh

service openstack-nova-compute restart
chkconfig openstack-nova-compute on

