#!/bin/sh

./mysqlq.sh "CREATE DATABASE keystone;"
./mysqlq.sh "CREATE USER 'keystone'@'localhost' IDENTIFIED BY '$MYSQL_KEYSTONE_PASSWORD';"
./mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'localhost';"
