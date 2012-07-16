#!/bin/sh

# Connect to the MySQL server as root using the password from
# $MYSQL_ROOT_PASSWORD defined in configrc
mysql --user=root --password=$MYSQL_ROOT_PASSWORD
