#!/bin/sh

openstack-config --set /etc/glance/glance-api.conf paste_deploy flavor keystone

openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD

openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_password $GLANCE_SERVICE_PASSWORD

openstack-config --set /etc/glance/glance-registry.conf paste_deploy flavor keystone
openstack-config --set /etc/glance/glance-registry.conf DEFAULT sql_connection mysql://glance:$GLANCE_MYSQL_PASSWORD@controller/glance

openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD
