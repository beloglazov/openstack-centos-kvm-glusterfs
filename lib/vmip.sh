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


# This script returns the IP address of a VM instance by its name
# defined in libvirt. The scripts accepts a parameter specifying the
# VM instance name.

if [ $# -ne 1 ]
then
    echo "You must specify one argument - the libvirt name of a VM instance"
    exit 1
fi

nmap -sT -PN -T5 -p22 192.168.0.0/24 > /dev/null 2>&1
ip neighbour | grep `virsh dumpxml $1 | grep "mac address" | cut -d \' -f2` |cut -d ' ' -f1
