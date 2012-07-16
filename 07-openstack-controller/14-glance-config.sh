#!/bin/sh

# Make Glance API use Keystone as the identity management service
openstack-config --set /etc/glance/glance-api.conf paste_deploy flavor keystone

# Set Glance API user credentials
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD

# Set Glance Cache user credentials
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_password $GLANCE_SERVICE_PASSWORD

# Make Glance Registry use Keystone as the identity management service
openstack-config --set /etc/glance/glance-registry.conf paste_deploy flavor keystone

# Set the connection to the MySQL server
openstack-config --set /etc/glance/glance-registry.conf DEFAULT sql_connection mysql://glance:$GLANCE_MYSQL_PASSWORD@controller/glance

# Set Glance Registry user credentials
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD
