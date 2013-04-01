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


# Create a database for Keystone
../lib/mysqlq.sh "CREATE DATABASE keystone;"

# Create a keystone user and grant all privileges to the keystone database 
../lib/mysqlq.sh "GRANT ALL ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_MYSQL_PASSWORD';"
