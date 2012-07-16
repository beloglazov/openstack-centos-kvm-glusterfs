#!/bin/sh

# Set the generated admin token in the Keystone configuration
openstack-config --set /etc/keystone/keystone.conf DEFAULT admin_token `cat keystone-admin-token`

# Set the connection to the MySQL server
openstack-config --set /etc/keystone/keystone.conf sql connection mysql://keystone:$KEYSTONE_MYSQL_PASSWORD@controller/keystone
