#!/bin/sh

# Set restrictive permissions for the Nova config file
chmod 640 /etc/nova/nova.conf

# Set the ownership for the Nova related directories
chown -R root:nova /etc/nova
chown -R nova:nova /var/lib/nova
