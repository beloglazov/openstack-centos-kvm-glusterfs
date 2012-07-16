#!/bin/sh

# Enable ping for VMs
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0

# Enable SSH for VMs
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
