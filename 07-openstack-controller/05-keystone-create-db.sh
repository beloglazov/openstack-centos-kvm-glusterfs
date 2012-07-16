#!/bin/sh

../lib/mysqlq.sh "CREATE DATABASE keystone;"
../lib/mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'controller' IDENTIFIED BY '$KEYSTONE_MYSQL_PASSWORD';"

