#!/bin/sh

# Start the Keystone service
service openstack-keystone restart
chkconfig openstack-keystone on
