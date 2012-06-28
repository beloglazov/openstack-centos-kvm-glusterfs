#!/bin/sh

./mysqlq.sh "CREATE DATABASE keystone;"
./mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'controller' IDENTIFIED BY '$MYSQL_KEYSTONE_PASSWORD';"

