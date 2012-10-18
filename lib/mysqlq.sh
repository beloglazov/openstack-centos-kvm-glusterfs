#!/bin/sh

# Copyright 2012 Anton Beloglazov
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# This scripts executes an SQL query specified as a parameter using
# the MySQL connection created by the mysql.sh script

if [ $# -ne 1 ]
then
    echo "You must specify one argument - an SQL query string"
    exit 1
fi

set -f

echo "QUERY: "$1

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $1 | ${DIR}/mysql.sh 

set +f