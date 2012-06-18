#!/bin/sh

openstack-config --set /etc/nova/nova.conf DEFAULT sql_connection mysql://nova:$MYSQL_NOVA_PASSWORD@controller/nova
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone
