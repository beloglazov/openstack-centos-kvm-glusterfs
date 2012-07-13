#!/bin/sh

cp keystonerc.default keystonerc
echo "export ADMIN_TOKEN=`cat keystone-admin-token`" >> keystonerc

openstack-config --set /etc/keystone/keystone.conf DEFAULT admin_token `cat keystone-admin-token`

