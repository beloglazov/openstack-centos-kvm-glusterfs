#!/bin/sh

git clone https://github.com/nimbis/keystone-init.git

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

./keystone-init/keystone-init.py ./keystone-init/config.yaml

echo ""
echo "The applied config file is keystone-init/config.yaml"
echo "You may do 'rm -rf keystone-init' to remove the no more needed keystone-init directory"
