#!/bin/sh

./mysqlq.sh "CREATE DATABASE nova;"
./mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$MYSQL_NOVA_PASSWORD';"
