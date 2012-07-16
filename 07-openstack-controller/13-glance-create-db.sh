#!/bin/sh

# Create a database for Glance
../lib/mysqlq.sh "CREATE DATABASE glance;"

# Create a glance user and grant all privileges to the glance database 
../lib/mysqlq.sh "GRANT ALL ON glance.* TO 'glance'@'controller' IDENTIFIED BY '$GLANCE_MYSQL_PASSWORD';"

