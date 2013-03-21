#!/bin/sh

# Copyright 2012 Anton Beloglazov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Start the Qpid AMQP message broker
service qpidd restart

# iSCSI target daemon for nova-volume
service tgtd restart

# Start OpenStack Nova services
service openstack-nova-api restart
service openstack-nova-cert restart
service openstack-nova-consoleauth restart
# The following has been removed in Folsom
# Uncomment for older versions of OpenStack
#service openstack-nova-direct-api restart
service openstack-nova-metadata-api restart
service openstack-nova-scheduler restart
service openstack-nova-volume restart

# Make the service start on the system startup
chkconfig qpidd on
chkconfig tgtd on
chkconfig openstack-nova-api on
chkconfig openstack-nova-cert on
chkconfig openstack-nova-consoleauth on
# The following has been removed in Folsom
# Uncomment for older versions of OpenStack
#chkconfig openstack-nova-direct-api on
chkconfig openstack-nova-metadata-api on
chkconfig openstack-nova-scheduler on
chkconfig openstack-nova-volume on
