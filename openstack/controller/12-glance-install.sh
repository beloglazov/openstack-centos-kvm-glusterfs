#!/bin/sh

yum install -y openstack-glance
rm /var/lib/glance/glance.sqlite
