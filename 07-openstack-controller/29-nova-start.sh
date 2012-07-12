#!/bin/sh

service qpidd restart
service openstack-nova-api restart
service openstack-nova-cert restart
service openstack-nova-consoleauth restart
service openstack-nova-direct-api restart
service openstack-nova-metadata-api restart
service openstack-nova-scheduler restart

# This is iSCSI target for nova-volume
service tgtd restart
service openstack-nova-volume restart

# This service is used by VNC client proxies
#service openstack-nova-xvpvncproxy restart
#service openstack-nova-novncproxy restart
# This is a Xen specific service
#service openstack-nova-console restart


chkconfig qpidd on
chkconfig openstack-nova-api on
chkconfig openstack-nova-cert on
chkconfig openstack-nova-consoleauth on
chkconfig openstack-nova-direct-api on
chkconfig openstack-nova-metadata-api on
chkconfig openstack-nova-scheduler on
chkconfig tgtd on
chkconfig openstack-nova-volume on
#chkconfig openstack-nova-novncproxy on
#chkconfig openstack-nova-xvpvncproxy on
#chkconfig openstack-nova-console on
