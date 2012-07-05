#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT sql_connection mysql://nova:$NOVA_MYSQL_PASSWORD@controller/nova
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone
openstack-config --set /etc/nova/nova.conf DEFAULT qpid_hostname controller

openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_user $NOVA_SERVICE_USERNAME
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_password $NOVA_SERVICE_PASSWORD
openstack-config --set /etc/nova/api-paste.ini filter:authtoken auth_uri $NOVA_OS_AUTH_URL

# VNC setup
openstack-config --set /etc/nova/nova.conf DEFAULT vncserver_listen 0.0.0.0
openstack-config --set /etc/nova/nova.conf DEFAULT vncserver_proxyclient_address controller
# This is the public IP accessible from outside, where novncproxy is running on
openstack-config --set /etc/nova/nova.conf DEFAULT novncproxy_base_url 128.250.26.161
# This is the public IP accessible from outside, where novncproxy is running on
openstack-config --set /etc/nova/nova.conf DEFAULT xvpvncproxy_base_url 128.250.26.161
