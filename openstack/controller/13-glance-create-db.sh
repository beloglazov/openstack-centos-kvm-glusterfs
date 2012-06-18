#!/bin/sh

./mysqlq.sh "CREATE DATABASE glance;"
./mysqlq.sh "GRANT ALL ON glance.* TO 'glance'@'%' IDENTIFIED BY '$MYSQL_GLANCE_PASSWORD';"

