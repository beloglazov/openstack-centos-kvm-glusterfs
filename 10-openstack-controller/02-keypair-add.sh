#!/bin/sh

# Create a keypair, which can be used for auto-injection into VMs for
# password-less SSH connections
nova keypair-add test > ../config/test.pem
chmod 600 ../config/test.pem
