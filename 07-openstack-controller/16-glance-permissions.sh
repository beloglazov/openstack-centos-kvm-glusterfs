#!/bin/sh

# Set restrictive permissions for the Glance config files
chmod 640 /etc/glance/*.conf
chmod 640 /etc/glance/*.ini

# Set the ownership for the Glance related directories
chown -R glance:glance /var/log/glance
chown -R glance:glance /var/lib/glance
