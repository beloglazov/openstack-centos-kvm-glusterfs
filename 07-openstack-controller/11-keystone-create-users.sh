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


# Install PyYAML, a YAML Python library
yum install -y PyYAML

# Clone a repository with Keystone initialization scripts
git clone https://github.com/nimbis/keystone-init.git

# Replace the default configuration with the values defined be the
# environmental variables in configrc
sed -i "s/192.168.206.130/controller/g" keystone-init/config.yaml
sed -i "s/012345SECRET99TOKEN012345/`cat keystone-admin-token`/g" keystone-init/config.yaml
sed -i "s/name:        openstackDemo/name:        $OS_TENANT_NAME/g" keystone-init/config.yaml
sed -i "s/name:     adminUser/name:     $OS_USERNAME/g" keystone-init/config.yaml
sed -i "s/password: secretword/password: $OS_PASSWORD/g" keystone-init/config.yaml
sed -i "s/name:     glance/name:     $GLANCE_SERVICE_USERNAME/g" keystone-init/config.yaml
sed -i "s/password: glance/password: $GLANCE_SERVICE_PASSWORD/g" keystone-init/config.yaml
sed -i "s/name:     nova/name:     $NOVA_SERVICE_USERNAME/g" keystone-init/config.yaml
sed -i "s/password: nova/password: $NOVA_SERVICE_PASSWORD/g" keystone-init/config.yaml
sed -i "s/RegionOne/$OS_REGION_NAME/g" keystone-init/config.yaml

# Run the Keystone initialization script
./keystone-init/keystone-init.py ./keystone-init/config.yaml

echo ""
echo "The applied config file is keystone-init/config.yaml"
echo "You may do 'rm -rf keystone-init' to remove the no more needed keystone-init directory"
