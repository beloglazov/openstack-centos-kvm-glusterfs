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


# It is assumed that the gateway host is one of the compute hosts;
# therefore, the openstack-nova-* service are already installed.

# Start the libvirt and Nova services (network, and VNC proxies)
service libvirtd restart
service openstack-nova-network restart
service openstack-nova-novncproxy restart
service openstack-nova-xvpvncproxy restart

# Make the service start on the system startup
chkconfig openstack-nova-network on
chkconfig openstack-nova-novncproxy on
chkconfig openstack-nova-xvpvncproxy on
