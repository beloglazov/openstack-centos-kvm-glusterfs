#!/bin/sh

# Enable ping
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0

# Enable ssh
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
