#!/bin/sh

chown -R root:nova /etc/nova
chown -R nova:nova /var/lib/nova
chmod 640 /etc/nova/nova.conf
