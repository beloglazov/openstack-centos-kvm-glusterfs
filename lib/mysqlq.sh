#!/bin/sh

# This scripts executes an SQL query specified as a parameter using
# the MySQL connection created by the mysql.sh script

echo "QUERY: "$1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $1 | ${DIR}/mysql.sh 
