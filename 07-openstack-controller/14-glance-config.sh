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

# Change Log:
# - Added sql_connection to glance-api.conf, required in Folsom
#   (http://wiki.openstack.org/ReleaseNotes/Folsom).
#	By: Mohammed Alrokayan
#	Data: 20/11/2012

# Make Glance API use Keystone as the identity management service
openstack-config --set /etc/glance/glance-api.conf paste_deploy flavor keystone

# Set Glance API user credentials
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-api-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD

# Set Glance Cache user credentials
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-cache.conf DEFAULT admin_password $GLANCE_SERVICE_PASSWORD

# Make Glance Registry use Keystone as the identity management service
openstack-config --set /etc/glance/glance-registry.conf paste_deploy flavor keystone

# Set the connection to the MySQL server
openstack-config --set /etc/glance/glance-registry.conf DEFAULT sql_connection mysql://glance:$GLANCE_MYSQL_PASSWORD@localhost/glance
# In Folsom, the sql_connection option has been moved from glance-registry.conf to glance-api.conf
openstack-config --set /etc/glance/glance-api.conf DEFAULT sql_connection mysql://glance:$GLANCE_MYSQL_PASSWORD@localhost/glance

# Set Glance Registry user credentials
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_tenant_name $GLANCE_SERVICE_TENANT
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_user $GLANCE_SERVICE_USERNAME
openstack-config --set /etc/glance/glance-registry-paste.ini filter:authtoken admin_password $GLANCE_SERVICE_PASSWORD
