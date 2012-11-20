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

# Change Log:
# - Change: Replaced "exit 1" with user input.
#	By: Mohammed Alrokayan
#	Data: 20/11/2012


# Attach the created volume to a VM instance as /dev/vdc.

if [ $# -eq 2 ]
then
	nova volume-attach $1 $2 /dev/vdc
else
	echo "You must specify two arguments:"
    echo "(1) the name of the VM instance"
    echo "(2) the ID of the volume to attach"

	# show VMs
	nova list
    echo ''
    read -p 'From the above VMs, what is the name of the VM instance? ' VM_name
    
    # show volumes
    nova volume-list
    read -p 'From the above Volumes, what is the ID of the volume to attach? ' Volume_ID

    nova volume-attach $VM_name $Volume_ID /dev/vdc
fi

