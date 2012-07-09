#!/bin/sh

openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_tenant_name service
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_user nova
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_password servicepassword
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone

service openstack-nova-api restart
#service openstack-nova-compute restart

