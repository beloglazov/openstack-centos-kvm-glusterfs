#!/bin/sh

# Attach the created volume to a VM instance as /dev/vdc.

if [ $# -ne 2 ]
then
    echo "You must specify two arguments:"
    echo "(1) the name of the VM instance"
    echo "(2) the ID of the volume to attach"
    exit 1
fi

nova volume-attach $1 $2 /dev/vdc
