#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT verbose True

openstack-config --set /etc/nova/nova.conf DEFAULT sql_connection mysql://nova:$NOVA_MYSQL_PASSWORD@controller/nova
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone
openstack-config --set /etc/nova/nova.conf DEFAULT qpid_hostname controller

openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_user $NOVA_SERVICE_USERNAME
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_password $NOVA_SERVICE_PASSWORD
openstack-config --set /etc/nova/api-paste.ini filter:authtoken auth_uri $NOVA_OS_AUTH_URL

# may also need to set service_host and auth_host to controller


# Network setup
openstack-config --set /etc/nova/nova.conf DEFAULT network_host compute1
openstack-config --set /etc/nova/nova.conf DEFAULT fixed_range 10.0.0.0/24
#openstack-config --set /etc/nova/nova.conf DEFAULT flat_network_dhcp_start 192.168.0.20
openstack-config --set /etc/nova/nova.conf DEFAULT flat_interface eth1
openstack-config --set /etc/nova/nova.conf DEFAULT flat_network_bridge br100
openstack-config --set /etc/nova/nova.conf DEFAULT public_interface eth0


# Glance setup
openstack-config --set /etc/nova/nova.conf DEFAULT glance_host controller

# VNC setup
openstack-config --set /etc/nova/nova.conf DEFAULT vncserver_listen 0.0.0.0
