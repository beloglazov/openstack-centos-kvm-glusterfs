#!/bin/sh

chmod 640 /etc/glance/*.conf
chmod 640 /etc/glance/*.ini

chown -R glance /var/lib/glance/images/
