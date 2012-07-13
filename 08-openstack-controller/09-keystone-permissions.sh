#!/bin/sh

chmod 640 /etc/keystone/keystone.conf

chown -R keystone:keystone /var/log/keystone
chown -R keystone:keystone /var/lib/keystone
