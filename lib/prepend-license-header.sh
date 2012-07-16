#!/bin/sh

# This scripts prepends the license header provided in the
# license-header file to the file specified as an argument

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cat ${DIR}/license-header | cat - $1 > /tmp/out && mv /tmp/out $1
