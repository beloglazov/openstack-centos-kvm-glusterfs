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


# Fetch the NTP servers specified in ../config/ntp.conf
SERVER1=`cat ../config/ntp.conf | sed '1!d;q'`
SERVER2=`cat ../config/ntp.conf | sed '2!d;q'`
SERVER3=`cat ../config/ntp.conf | sed '3!d;q'`

# Replace the default NTP servers with the above
sed -i "s/server 0.*pool.ntp.org/$SERVER1/g" /etc/ntp.conf
sed -i "s/server 1.*pool.ntp.org/$SERVER2/g" /etc/ntp.conf
sed -i "s/server 2.*pool.ntp.org/$SERVER3/g" /etc/ntp.conf
