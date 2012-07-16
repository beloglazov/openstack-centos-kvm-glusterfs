#!/bin/sh

# Create a database for Nova
../lib/mysqlq.sh "CREATE DATABASE nova;"

# Create a nova user and grant all privileges to the nova database 
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"

# The following is need to allow access from Nova services running on other hosts
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"
