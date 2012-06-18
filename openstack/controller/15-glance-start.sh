#!/bin/sh

service openstack-glance-registry restart
service openstack-glance-api restart

glance-manage db_sync

service openstack-glance-registry restart
service openstack-glance-api restart

chkconfig openstack-glance-registry on
chkconfig openstack-glance-api on
