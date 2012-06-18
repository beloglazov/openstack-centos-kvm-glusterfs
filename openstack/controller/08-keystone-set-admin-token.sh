#!/bin/sh

echo "export ADMIN_TOKEN=`cat keystone-admin-token`" >> configrc
openstack-config --set /etc/keystone/keystone.conf DEFAULT admin_token `cat keystone-admin-token`

