#!/bin/sh

sed -i "s/connection = mysql:\/\/keystone:keystone@localhost\/keystone/connection = mysql:\/\/keystone:$MYSQL_KEYSTONE_PASSWORD@controller\/keystone/g" /etc/keystone/keystone.conf
