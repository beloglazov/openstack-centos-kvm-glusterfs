#!/bin/sh

service qpidd restart
service openstack-nova-api restart
service openstack-nova-cert restart
service openstack-nova-consoleauth restart
service openstack-nova-direct-api restart
service openstack-nova-metadata-api restart
service openstack-nova-scheduler restart
service openstack-nova-network restart

# iSCSI target daemon for nova-volume
service tgtd restart
service openstack-nova-volume restart


chkconfig qpidd on
chkconfig openstack-nova-api on
chkconfig openstack-nova-cert on
chkconfig openstack-nova-consoleauth on
chkconfig openstack-nova-direct-api on
chkconfig openstack-nova-metadata-api on
chkconfig openstack-nova-scheduler on
chkconfig openstack-nova-network on
chkconfig tgtd on
chkconfig openstack-nova-volume on
