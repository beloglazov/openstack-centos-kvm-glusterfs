#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT sql_connection mysql://nova:$MYSQL_NOVA_PASSWORD@controller/nova
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone
openstack-config --set /etc/nova/nova.conf DEFAULT network_host compute1
openstack-config --set /etc/nova/nova.conf DEFAULT fixed_range 192.168.0.0/24
openstack-config --set /etc/nova/nova.conf DEFAULT flat_network_dhcp_start 192.168.0.20
openstack-config --set /etc/nova/nova.conf DEFAULT flat_interface eth1
openstack-config --set /etc/nova/nova.conf DEFAULT public_interface eth0

