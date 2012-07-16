#!/bin/sh

# This scripts executes an SQL query specified as a parameter using
# the MySQL connection created by the mysql.sh script

if [ $# -ne 1 ]
then
    echo "You must specify one argument - an SQL query string"
    exit 1
fi

echo "QUERY: "$1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $1 | ${DIR}/mysql.sh 
