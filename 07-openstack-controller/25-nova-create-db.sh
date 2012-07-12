#!/bin/sh

./mysqlq.sh "CREATE DATABASE nova;"
./mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"

# The following is need to allow access from nova services running on other hosts
./mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"
