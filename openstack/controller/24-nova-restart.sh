#!/bin/sh

service openstack-nova-api stop
service openstack-nova-scheduler stop
service openstack-nova-xvpvncproxy stop
service openstack-nova-volume stop
service openstack-nova-cert stop
service openstack-nova-consoleauth stop
service openstack-nova-console stop

nova-manage db sync

service openstack-nova-api start
service openstack-nova-scheduler start
service openstack-nova-xvpvncproxy start
service openstack-nova-volume start
service openstack-nova-cert start
service openstack-nova-consoleauth start
service openstack-nova-console start
