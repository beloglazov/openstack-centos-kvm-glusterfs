#!/bin/sh

git clone https://github.com/nimbis/keystone-init.git

sed -i "s/192.168.206.130/controller/g" keystone-init/config.yaml
sed -i "s/012345SECRET99TOKEN012345/`cat keystone-admin-token`/g" keystone-init/config.yaml
sed -i "s/openstackDemo/admin/g" keystone-init/config.yaml
sed -i "s/adminUser/admin/g" keystone-init/config.yaml
sed -i "s/secretword/$OS_ADMIN_PASSWORD/g" keystone-init/config.yaml
sed -i "s/password: glance/password: $OS_SERVICE_PASSWORD/g" keystone-init/config.yaml
sed -i "s/password: nova/password: $OS_SERVICE_PASSWORD/g" keystone-init/config.yaml
sed -i "s/password: ec2/password: $OS_SERVICE_PASSWORD/g" keystone-init/config.yaml
sed -i "s/password: swiftpass/password: $OS_SERVICE_PASSWORD/g" keystone-init/config.yaml

./keystone-init/keystone-init.py ./keystone-init/config.yaml

rm -rf keystone-init
