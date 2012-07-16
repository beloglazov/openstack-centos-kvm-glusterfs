#!/bin/sh

# Start the MySQL service
service mysqld start
chkconfig mysqld on

# Initialize the MySQL root password
mysqladmin -u root password $MYSQL_ROOT_PASSWORD

echo ""
echo "The MySQL root password has been set to the value of $MYSQL_ROOT_PASSWORD: \"$MYSQL_ROOT_PASSWORD\""
