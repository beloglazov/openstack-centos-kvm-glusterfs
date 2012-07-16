#!/bin/sh

../lib/mysqlq.sh "CREATE DATABASE nova;"
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"

# The following is need to allow access from nova services running on other hosts
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"
