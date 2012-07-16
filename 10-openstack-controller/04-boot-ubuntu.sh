#!/bin/sh

# Create a VM instances from the Ubuntu Cloud image and inject the
# generated public key for password-less SSH connections
nova boot --image ubuntu --flavor m1.small --key_name test ubuntu
