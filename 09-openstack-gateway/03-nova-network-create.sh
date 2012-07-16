#!/bin/sh

# Create a Nova network for VM instances: 10.0.0.0/24
nova-manage network create --label=public --fixed_range_v4=10.0.0.0/24 --num_networks=1 --network_size=256 --bridge=br100
