#!/bin/sh

openstack-config --set /etc/keystone/keystone.conf DEFAULT admin_token `cat keystone-admin-token`
openstack-config --set /etc/keystone/keystone.conf sql connection mysql://keystone:$KEYSTONE_MYSQL_PASSWORD@controller/keystone

