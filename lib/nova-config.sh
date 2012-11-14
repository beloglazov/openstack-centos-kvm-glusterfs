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


# This is a Nova configuration shared by the compute hosts, gateway and controller

# Enable verbose output
openstack-config --set /etc/nova/nova.conf DEFAULT verbose True

# Set the connection to the MySQL server
openstack-config --set /etc/nova/nova.conf DEFAULT sql_connection mysql://nova:$NOVA_MYSQL_PASSWORD@controller/nova

# Make Nova use Keystone as the identity management service
openstack-config --set /etc/nova/nova.conf DEFAULT auth_strategy keystone

# Set the host name of the Qpid AMQP message broker
openstack-config --set /etc/nova/nova.conf DEFAULT qpid_hostname controller

# Set Nova user credentials
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_tenant_name $NOVA_SERVICE_TENANT
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_user $NOVA_SERVICE_USERNAME
openstack-config --set /etc/nova/api-paste.ini filter:authtoken admin_password $NOVA_SERVICE_PASSWORD
openstack-config --set /etc/nova/api-paste.ini filter:authtoken auth_uri $NOVA_OS_AUTH_URL

# Set the network configuration
openstack-config --set /etc/nova/nova.conf DEFAULT network_host compute1
openstack-config --set /etc/nova/nova.conf DEFAULT fixed_range 10.0.0.0/24
openstack-config --set /etc/nova/nova.conf DEFAULT flat_interface eth1
openstack-config --set /etc/nova/nova.conf DEFAULT flat_network_bridge br100
openstack-config --set /etc/nova/nova.conf DEFAULT public_interface eth1
openstack-config --set /etc/nova/nova.conf DEFAULT force_dhcp_release False

# Set the Glance host name
openstack-config --set /etc/nova/nova.conf DEFAULT glance_host controller

# Set the VNC configuration
openstack-config --set /etc/nova/nova.conf DEFAULT vncserver_listen 0.0.0.0
openstack-config --set /etc/nova/nova.conf DEFAULT vncserver_proxyclient_address controller
# This is the host accessible from outside, where novncproxy is running on
openstack-config --set /etc/nova/nova.conf DEFAULT novncproxy_base_url http://$PUBLIC_IP_ADDRESS:6080/vnc_auto.html
# This is the host accessible from outside, where xvpvncproxy is running on
openstack-config --set /etc/nova/nova.conf DEFAULT xvpvncproxy_base_url http://$PUBLIC_IP_ADDRESS:6081/console

# Set the host name of the metadata service
openstack-config --set /etc/nova/nova.conf DEFAULT metadata_host $METADATA_HOST
