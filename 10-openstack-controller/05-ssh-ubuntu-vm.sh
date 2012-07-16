#!/bin/sh

# SSH into an Ubuntu VM. This script accepts the IP address of the VM
# instance as a parameter.
ssh -i ../config/test.pem -l ubuntu $1
