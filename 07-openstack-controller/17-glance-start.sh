#!/bin/sh

# Start the Glance Registry and API services
service openstack-glance-registry restart
service openstack-glance-api restart

chkconfig openstack-glance-registry on
chkconfig openstack-glance-api on
