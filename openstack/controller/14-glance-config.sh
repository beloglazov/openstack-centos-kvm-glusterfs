#!/bin/sh

openstack-config --set /etc/glance/glance-registry.conf DEFAULT sql_connection mysql://glance:$MYSQL_GLANCE_PASSWORD@controller/glance


#openstack-config --set /etc/glance/glance-api.conf paste_deploy flavor keystone
#openstack-config --set /etc/glance/glance-registry.conf paste_deploy flavor keystone

#openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_tenant_name service
#openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_user glance
#openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_password $OS_SERVICE_PASSWORD
#openstack-config --del /etc/glance/glance-api-paste.ini pipeline:glance-api pipeline
#openstack-config --set /etc/glance/glance-api-paste.ini pipeline:glance-api pipeline "versionnegotiation authtoken auth-context apiv1app"

#openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_tenant_name service
#openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_user glance
#openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_password $OS_SERVICE_PASSWORD

#openstack-config --del /etc/glance/glance-registry-paste.ini pipeline:glance-registry pipeline
#openstack-config --set /etc/glance/glance-registry-paste.ini pipeline:glance-registry pipeline "authtoken auth-context context registryapp"

#openstack-config --set /etc/glance/glance-registry.conf DEFAULT sql_connection mysql://glance:$MYSQL_GLANCE_PASSWORD@controller/glance
#openstack-config --set /etc/glance/glance-scrubber.conf DEFAULT sql_connection mysql://glance:$MYSQL_GLANCE_PASSWORD@controller/glance
