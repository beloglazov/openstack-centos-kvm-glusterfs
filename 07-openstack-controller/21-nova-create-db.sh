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


# Create a database for Nova
../lib/mysqlq.sh "CREATE DATABASE nova;"

# Create a nova user and grant all privileges to the nova database 
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'localhost' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"

# The following is need to allow access from Nova services running on other hosts
../lib/mysqlq.sh "GRANT ALL ON nova.* TO 'nova'@'%' IDENTIFIED BY '$NOVA_MYSQL_PASSWORD';"
