#!/bin/sh

service mysqld start
chkconfig mysqld on

# need to set the root password using:
# mysqladmin -u root password <new password>
