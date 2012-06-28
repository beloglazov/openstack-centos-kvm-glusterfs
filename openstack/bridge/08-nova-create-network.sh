#!/bin/sh

nova-manage network create --label=public --fixed_range_v4=192.168.0.0/24 --num_networks=1 --network_size=256 --bridge=br100
