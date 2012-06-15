#!/bin/sh

service openstack-glance-api start
chkconfig openstack-glance-api on

service openstack-glance-registry start
chkconfig openstack-glance-registry on
