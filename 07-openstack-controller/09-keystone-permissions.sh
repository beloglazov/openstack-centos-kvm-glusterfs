#!/bin/sh

# Set restrictive permissions on the Keystone config file since it
# contains the MySQL password and admin token
chmod 640 /etc/keystone/keystone.conf

# Set the ownership for the Keystone related directories
chown -R keystone:keystone /var/log/keystone
chown -R keystone:keystone /var/lib/keystone
