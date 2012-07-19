% A Step-by-Step Guide to Installing OpenStack on CentOS Using the KVM Hypervisor and GlusterFS
  Distributed File System
% Anton Beloglazov; Sareh Fotuhi Piraghaj; Mohammed Alrokayan; Rajkumar Buyya


\newpage


# Introduction

- Cloud Computing [@armbrust2010view; @buyya2009cloud]
- Public / Private / Hybrid
- Why Open Source Cloud Platforms are Important
- OpenStack / Eucalyptus / CloudStack / OpenNebula
- Complexity of Installing OpenStack
- Our Step-by-Step Scripted Installation Approach
- The purpose is not just having an up and running OpenStack installation, but also learning the steps
  required to perform the installation from the ground up and understanding the responsibilities and
  interaction of the OpenStack components.

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
IBM System x3200 M3 servers are used as *compute hosts*, i.e. for hosting VM instances.

Due to specifics of our setup, the only one machine connected to public network and the Internet is
one of the IBM System x3200 M3 servers. This server is refereed to as the *gateway*. The gateway is
connected to the public network via the eth0 network interface.

All the machines form a local network connected through the Netgear FS116 network switch. The
compute hosts are connected to the local network via their eth1 network interfaces. The controller
is connected to the local network through its eth0 interface. To provide the access to the public
network and the Internet, the gateway performs Network Address Translation (NAT) for the hosts from
the local network.


## Organization of the Installation Package

The project contains a number of directories, whose organization is explained in this section. The
`config` directory includes configuration files, which are used by the installation scripts and
should be modified prior to the installation. The `lib` directory contains utility scripts that are
shared by the other installation scripts. The `doc` directory comprises the source and compiled
versions of the documentation.

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

The `lib` directory contains configuration files used by the installation scripts. These
configuration files should be modified prior to running the installation scripts. The configuration
files are described below.


  `configrc:`

  :    This files contains a number of environmental variables defining various aspects of OpenStack's
       configuration, such as administration and service account credentials, as well as access
       points. The file must be "sourced" to export the variables into the current shell session.
       The file can be sourced directly by running: `. configrc`, or using the scripts described
       later. A simple test to check whether the variables have been correctly exported is to `echo`
       any of the variables. For example, `echo $OS_USERNAME` must output `admin` for the
       default configuration.

  `hosts:`

  :    This files contains a mapping between the IP addresses of the hosts in the local network and
       their host names. We apply the following host name convention: the compute hosts are named
       *computeX*, where *X* is replaced by the number of the host. According the described hardware
       setup, the default configuration defines 1 `controller` (192.168.0.1), and 4 compute hosts:
       `compute1` (192.168.0.1), `compute2` (192.168.0.2), `compute3` (192.168.0.3), `compute4`
       (192.168.0.4). As mentioned above, in our setup one of the compute hosts is connected to the
       public network and acts as a gateway. We assign to this host the host name `compute1`, and
       also alias it as `gateway`.


  `ntp.conf:`

  :    This files contains a list of Network Time Protocol (NTP) servers to use by all the hosts. It
       is important to set accessible servers, since time synchronization is important for OpenStack
       services to interact correctly. By default, this file defines servers used within the
       University of Melbourne. It is advised to replace the default configuration with a list of
       preferred servers.

It is important to replaced the default configuration defined in the described configuration files,
since the default configuration is tailored to the specific setup of our testbed.


## Installation Procedure

### CentOS Installation

The installation scripts have been tested with CentOS 6.3^[http://www.centos.org/], which has been
installed on all the hosts. The CentOS installation mainly follows the standard process described in
detail in the Red Hat Enterprise Linux 6 Installation Guide [@redhat2012installation]. The steps of
the installation process that differ from the standard are discussed in this section.


#### Network Configuration.

The simplest way to configure network is during the OS installation process. As mentioned above, in
our setup, the gateway is connected to two networks: to the public network through the eth0
interface; and to the local network through the eth1 interface. Since in our setup the public
network configuration can be obtain from a DHCP server, in the configuration of the eth0 interface
it is only required to enable automatic connection by enabling the "Connect Automatically" option.
We use static configuration for the local network; therefore, eth1 has be configured manually. Apart
from enabling the "Connect Automatically" option, it is necessary to configure IPv4 by adding an IP
address and netmask. According to the configuration defined in the `hosts` file described above, we
assign 192.168.0.1/24 to the gateway.

One difference in the network configuration of the other compute hosts (`compute2`, `compute3`, and
`compute4`) from the gateway is that eth0 should be kept disabled, as it is unused. The eth1
interface should be enabled by turning on the "Connect Automatically" option. The IP address and
netmask for eth1 should be set to 192.168.0.*X*/24, where *X* is replaced by the compute host
number. The gateway for the compute hosts should be set to 192.168.0.1, which the IP address of the
gateway host. The controller is configured similarly to the compute hosts with the only difference
that the configuration should be done for eth0 instead of eth1, since the controller has only one
network interface.


#### Disk Partitioning.




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
