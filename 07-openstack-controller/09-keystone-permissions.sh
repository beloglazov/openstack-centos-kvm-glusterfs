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


# Set restrictive permissions on the Keystone config file since it
# contains the MySQL password and admin token
chmod 640 /etc/keystone/keystone.conf

# Set the ownership for the Keystone related directories
chown -R keystone:keystone /var/log/keystone
chown -R keystone:keystone /var/lib/keystone
