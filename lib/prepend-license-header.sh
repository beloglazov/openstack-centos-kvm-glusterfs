#!/bin/sh

# This script prepends the license header provided in the
# license-header file to the file specified as an argument

sed -i 's/#!\/bin\/sh//g' $1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $1 /tmp/out
cat ${DIR}/license-header > $1
cat /tmp/out >> $1
rm -f /tmp/out
