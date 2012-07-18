% A Step-by-Step Guide to Installing OpenStack on CentOS Using the KVM Hypervisor and GlusterFS
  Distributed File System
% Anton Beloglazov; Sareh Fotuhi Piraghaj; Mohammed Alrokayan; Rajkumar Buyya



# Introduction

- Cloud Computing [@armbrust2010view; @buyya2009cloud]
- Public / Private / Hybrid
- Why Open Source Cloud Platforms are Important
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

The testbed used for testing the installation scripts consists of the following hardware:

- 1 x Dell Optiplex 745
	- Intel(R) Core(TM)2 CPU (2 cores, 2 threads) 6600 @ 2.40GHz
	- 2GB DDR2-667
	- Seagate Barracuda 80GB, 7200 RPM SATA II (ST3808110AS)
	- Broadcom 5751 NetXtreme Gigabit Controller

- 4 x IBM System x3200 M3
	- Intel(R) Xeon(R) CPU (4 cores, 8 threads), X3460 @ 2.80GHz
	- 4GB DDR3-1333
	- Western Digital 250 GB, 7200 RPM SATA II (WD2502ABYS-23B7A)
	- Dual Gigabit Ethernet (2 x Intel 82574L Ethernet Controller)

- 1 x Netgear ProSafe 16-Port 10/100 Desktop Switch FS116

The Dell Optiplex 745 machine has been chosen to serve as a management host running all the major
OpenStack services. The management host is referred to as the *controller* further in the text. The 4
IBM System x3200 M3 servers have been used as *compute hosts*, i.e. for hosting VM instances.

Due to specifics of our setup, the only one machine connected to public network and the Internet is
one of the IBM System x3200 M3 servers. This server is refereed to as the *gateway*. The gateway is
connected to the public network via the eth0 network interface.

All the machines are connected into a local network through the Netgear FS116 network switch. The
compute hosts are connected to the local network via their eth1 network interfaces. The controller
is connected to the local network through its eth0 interface. The gateway performs Network Address
Translation (NAT) for the hosts in the local network to provide the access to the public network and
the Internet.


## Organization of the Installation Package

- Config Directory
- Lib Directory
- Ordered Script Directories
- Script ordering

The project contains a number of directories, whose organization is explained in this section. The
`config` directory includes configuration files, which are used by the installation scripts and can
be modified prior to the installation. The `lib` directory contains utility scripts that are shared
by the other installation scripts. The `doc` directory comprises the source and compiled versions of
the documentation.

The remaining directories directly include the step-by-step installation scripts. The names of these
directories have a specific format. The prefix (before the first dash) is the number denoting the
order of execution. For example, the scripts from the directory with the prefix *01* must be
executed first, followed by the scripts from the directory with the prefix *02*, etc. The middle
part of a directory name denotes the purpose of the scripts in this directory. The suffix (after the
last dash) specifies the host, on which the scripts from this directory should be executed on. There
are 4 possible values of the target host prefix:

- *all* -- execute the scripts on all the hosts;
- *compute* -- execute the scripts on all the compute hosts;
- *controller* -- execute the scripts on the controller;
- *gateway* -- execute the scripts on the gateway.

For example, the first directory is named `01-network-gateway`, which means that (1) the scripts from this
directory must be executed in the first place; (2) the scripts are supposed to do a network set up;
and (3) the scripts must be executed only on the gateway. The name `02-glusterfs-all` means: (1) the
scripts from this directory must be executed after the scripts from `01-network-gateway`; (2) the
scripts set up GlusterFS; and (3) the scripts must be executed on all the hosts.

The names of the installation scripts themselves follow a similar convention. The prefix denotes the
order, in which the scripts should be run, while the remaining part of the name describes the
purpose of the script.


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
