#!/bin/sh

chmod 640 /etc/glance/*.conf
chmod 640 /etc/glance/*.ini

chown -R glance:glance /var/log/glance
chown -R glance:glance /var/lib/glance
