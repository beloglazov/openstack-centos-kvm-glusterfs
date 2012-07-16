#!/bin/sh

# SSH into a VM instance.

if [ $# -ne 2 ]
then
    echo "You must specify two arguments:"
    echo "(1) the username corresponing to the ../config/test.pem key"
    echo "(2) the IP address of the VM instance"
    exit 1
fi

ssh -i ../config/test.pem -l $1 $2
