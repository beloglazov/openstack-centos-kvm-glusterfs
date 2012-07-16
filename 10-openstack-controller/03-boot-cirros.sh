#!/bin/sh

# Create a VM instances from the Cirros image
nova boot --image cirros-0.3.0-x86_64 --flavor m1.small cirros
