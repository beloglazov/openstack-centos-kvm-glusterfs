#!/bin/sh

openstack-config --set /etc/keystone/keystone.conf sql connection mysql://keystone:$MYSQL_KEYSTONE_PASSWORD@controller/keystone
