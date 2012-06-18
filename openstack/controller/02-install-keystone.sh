#!/bin/sh

yum install -y openstack-utils openstack-keystone

rm /var/lib/keystone/keystone.db
