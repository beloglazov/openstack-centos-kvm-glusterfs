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


# Attach the created volume to a VM instance as /dev/vdc.

if [ $# -ne 2 ]
then
    echo "You must specify two arguments:"
    echo "(1) the name of the VM instance"
    echo "(2) the ID of the volume to attach"
    exit 1
fi

nova volume-attach $1 $2 /dev/vdc
