#!/bin/sh

./mysqlq.sh "CREATE DATABASE glance;"
./mysqlq.sh "GRANT ALL ON glance.* TO 'glance'@'controller' IDENTIFIED BY '$GLANCE_MYSQL_PASSWORD';"

