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


# Set restrictive permissions for the Nova config file
chmod 640 /etc/nova/nova.conf

# Set the ownership for the Nova related directories
chown -R root:nova /etc/nova
chown -R nova:nova /var/lib/nova
chown -R nova:nova /var/cache/libvirt
chown -R nova:nova /var/run/libvirt
chown -R nova:nova /var/lib/libvirt

# Make Qemu run under the nova user and group
sed -i 's/#user = "root"/user = "nova"/g' /etc/libvirt/qemu.conf
sed -i 's/#group = "root"/group = "nova"/g' /etc/libvirt/qemu.conf
