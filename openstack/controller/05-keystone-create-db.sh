#!/bin/sh

./mysqlq.sh "CREATE DATABASE keystone;"
./mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$MYSQL_KEYSTONE_PASSWORD';"

