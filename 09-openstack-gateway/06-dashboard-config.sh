#!/bin/sh

# Set the OpenStack management host
sed -i 's/OPENSTACK_HOST = "127.0.0.1"/OPENSTACK_HOST = "controller"/g' /etc/openstack-dashboard/local_settings

# Set the Keystone default role
sed -i "s/OPENSTACK_KEYSTONE_DEFAULT_ROLE = \"Member\"/OPENSTACK_KEYSTONE_DEFAULT_ROLE = \"$OS_TENANT_NAME\"/g" /etc/openstack-dashboard/local_settings
