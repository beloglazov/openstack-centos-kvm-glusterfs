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


# Download the Cirros VM image
mkdir /tmp/images
cd /tmp/images
wget https://launchpad.net/cirros/trunk/0.3.0/+download/cirros-0.3.0-x86_64-disk.img

# Add the downloaded image to Glance
glance add name="cirros-0.3.0-x86_64" is_public=true disk_format=qcow2 container_format=bare < cirros-0.3.0-x86_64-disk.img

# Remove the temporary directory
rm -rf /tmp/images
