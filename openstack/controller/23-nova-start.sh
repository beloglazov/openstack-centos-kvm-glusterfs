#!/bin/sh

service openstack-nova-api restart
service openstack-nova-network restart
service openstack-nova-scheduler restart
service openstack-nova-xvpvncproxy restart
service openstack-nova-volume restart
service rabbitmq-server restart

chkconfig openstack-nova-api on
chkconfig openstack-nova-network on
chkconfig openstack-nova-scheduler on
chkconfig openstack-nova-xvpvncproxy on
chkconfig openstack-nova-volume on
chkconfig rabbitmq-server on

