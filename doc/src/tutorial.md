% A Step-by-Step Guide to Installing OpenStack on CentOS Using the KVM Hypervisor and GlusterFS
  Distributed File System
% Anton Beloglazov; Sareh Fotuhi Piraghaj; Mohammed Alrokayan; Rajkumar Buyya


# Introduction

- Cloud Computing [@armbrust2010view; @buyya2009cloud]
- Public / Private / Hybrid
- Why Open Souce Cloud Platforms are Important
- OpenStack / Eucalyptus / CloudStack / OpenNebula
- Complexity of Installing OpenStack
- Our Step-by-Step Scripted Installation Approach

# Comparison of Open Source Cloud Platforms

- OpenStack
- Eucalyptus
- CloudStack
- OpenNebula

# Overview of the OpenStack Cloud Platform

- History
- Features
- Main Services
- Service Interaction

# Existing OpenStack Installation Tools

- DevStack^[http://devstack.org/]
- Puppet / Chef^[http://docs.openstack.org/trunk/openstack-compute/admin/content/openstack-compute-deployment-tool-with-puppet.html]
- Difference From our Approach

# Step-by-Step OpenStack Installation

## Hardware Setup

- Servers
- Network setup

- 4 x IBM System x3200 M3
	- Intel(R) Xeon(R) CPU (4 cores, 8 threads), X3460 @ 2.80GHz
	- 4GB DDR3-1333
	- Western Digital 250 GB, 7200 RPM SATA II (WD2502ABYS-23B7A)
	- Dual Gigabit Ethernet (2 x Intel 82574L Ethernet Controller)

- 1 x Dell Optiplex 745
	- Intel(R) Core(TM)2 CPU (2 cores, 2 threads) 6600 @ 2.40GHz
	- 2GB DDR2-667
	- Seagate Barracuda 80GB, 7200 RPM SATA II (ST3808110AS)
	- Broadcom 5751 NetXtreme Gigabit Controller

- NetGear ProSafe 16-Port 10/100 Desktop Switch FS116



## Organization of the Installation Package

- Config Directory
- Lib Directory
- Ordered Script Directories
- Script ordering

## Configuration Files

- configrc
- hosts
- ntp.conf


## Installation Procedure

### Network Gateway

### GlusterFS Distributed Replicated Storage

#### All nodes
#### Controller
#### All nodes

### KVM

### OpenStack

#### All nodes
#### Controller
#### Compute nodes
#### Network Gateway
#### Controller


### Testing of the OpenStack Installation

## OpenStack Troubleshooting

# Conclusion

# References
