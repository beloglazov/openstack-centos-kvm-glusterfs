#!/bin/sh

service mysqld start
chkconfig mysqld on

mysqladmin -u root password $MYSQL_ROOT_PASSWORD

echo ""
echo "The MySQL root password has been set to the value of $MYSQL_ROOT_PASSWORD"
