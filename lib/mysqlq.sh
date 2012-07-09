#!/bin/sh

echo "QUERY: "$1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $1 | ${DIR}/mysql.sh 
