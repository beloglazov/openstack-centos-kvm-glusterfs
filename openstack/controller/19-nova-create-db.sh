#!/bin/sh

./mysqlq.sh "CREATE DATABASE nova;"
./mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'controller' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"
