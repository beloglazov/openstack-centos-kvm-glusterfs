#!/bin/sh

../lib/mysqlq.sh "CREATE DATABASE glance;"
../lib/mysqlq.sh "GRANT ALL ON glance.* TO 'glance'@'controller' IDENTIFIED BY '$GLANCE_MYSQL_PASSWORD';"

