#!/bin/sh

# Create a database for Keystone
../lib/mysqlq.sh "CREATE DATABASE keystone;"

# Create a keystone user and grant all privileges to the keystone database 
../lib/mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'controller' IDENTIFIED BY '$KEYSTONE_MYSQL_PASSWORD';"
