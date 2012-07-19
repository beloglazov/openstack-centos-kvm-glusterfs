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


#### Hard Drive Partitioning.

The hard drive partitioning scheme is the same for all the compute hosts, but differs for the
controller. Table 1 shows the partitioning scheme for the compute hosts. `vg_base` is a volume group
comprising the standard operating system partitions: `lv_root`, `lv_home` and `lv_swap`.
`vg_gluster` is a special volume group containing a single `lv_gluster` partition, which is
dedicated to serve as a GlusterFS brick. The `lv_gluster` logical volume is formatted using the
XFS^[http://en.wikipedia.org/wiki/XFS] file system, as recommended for GlusterFS bricks.

Table: Partitioning scheme for the compute hosts

+---------------------+----------+--------------------+---------+
|Device               |Size\ (MB)|Mount Point / Volume|Type     |
+=====================+==========+====================+=========+
|*LVM Volume Groups*  |          |                    |         |
+---------------------+----------+--------------------+---------+
|\ \ vg\_base         |20996     |                    |         |
+---------------------+----------+--------------------+---------+
|\ \ \ \ lv\_root     |10000     |/                   |ext4     |
+---------------------+----------+--------------------+---------+
|\ \ \ \ lv\_swap     |6000      |                    |swap     |
+---------------------+----------+--------------------+---------+
|\ \ \ \ lv\_home     |4996      |/home               |ext4     |
+---------------------+----------+--------------------+---------+
|\ \ vg\_gluster      |216972    |                    |         |
+---------------------+----------+--------------------+---------+
|\ \ \ \ lv\_gluster  |216972    |/export/gluster     |xfs      |
+---------------------+----------+--------------------+---------+
|*Hard Drives*        |          |                    |         |
+---------------------+----------+--------------------+---------+
|\ \ sda              |          |                    |         |
+---------------------+----------+--------------------+---------+
|\ \ \ \ sda1         |500       |/boot               |ext4     |
+---------------------+----------+--------------------+---------+
|\ \ \ \ sda2         |21000     |vg\_base            |PV (LVM) |
+---------------------+----------+--------------------+---------+
|\ \ \ \ sda3         |216974    |vg\_gluster         |PV (LVM) |
+---------------------+----------+--------------------+---------+


Table 2 shows the partitioning scheme for the controller. It does not include a `vg_gluster` volume
group since the controller is not going to be a part of the GlusterFS volume. However, the scheme
includes two new important volume groups: `nova-volumes` and `vg_images`. The `nova-volumes` volume
group is used by OpenStack Nova to allocated volumes for VM instances. This volume group is managed
by Nova; therefore, there is not need to create logical volumes manually. The `vg_images` volume
group and its `lv_images` logical volume are dedicated for storing VM images by OpenStack Glance.
The mount point for `lv_images` is `/var/lib/glance/images`, which is the default directory used by
Glance to store image files.

Table: Partitioning scheme for the controller

+-------------------+----------+----------------------+---------+
|Device             |Size\ (MB)|Mount Point / Volume  |Type     |
+===================+==========+======================+=========+
|*LVM Volume Groups*|          |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ nova-volumes   |29996     |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ \ \ Free       |29996     |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ vg\_base       |16996     |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ \ \ lv\_root   |10000     |/                     |ext4     |
+-------------------+----------+----------------------+---------+
|\ \ \ \ lv\_swap   |2000      |                      |swap     |
+-------------------+----------+----------------------+---------+
|\ \ \ \ lv\_home   |4996      |/home                 |ext4     |
+-------------------+----------+----------------------+---------+
|\ \ vg\_images     |28788     |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ \ \ lv\_images |28788     |/var/lib/glance/images|ext4     |
+-------------------+----------+----------------------+---------+
|*Hard Drives*      |          |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ sda            |          |                      |         |
+-------------------+----------+----------------------+---------+
|\ \ \ \ sda1       |500       |/boot                 |ext4     |
+-------------------+----------+----------------------+---------+
|\ \ \ \ sda2       |17000     |vg\_base              |PV (LVM) |
+-------------------+----------+----------------------+---------+
|\ \ \ \ sda3       |30000     |nova-volumes          |PV (LVM) |
+-------------------+----------+----------------------+---------+
|\ \ \ \ sda4       |28792     |                      |Extended |
+-------------------+----------+----------------------+---------+
|\ \ \ \ \ \ sda5   |28788     |vg_images             |PV (LVM) |
+-------------------+----------+----------------------+---------+


### Network Gateway

Once CentOS is installed on all the machines, the next step is to configure NAT on the gateway to
enable the Internet access on all the hosts. First, it is necessary to check whether the Internet
is available on the gateway itself. If the Internet is not available, the problem might be in the
configuration of eth0, the network interface connected to the public network in our setup.

In all the following steps, it is assumed that the user logged in is `root`. If the Internet is
available on the gateway, it is necessary to install
Git^[http://en.wikipedia.org/wiki/Git_(software)] to be able to clone the repository containing the
installation scripts. This can be done using yum, the default package manager in CentOS, as follows:

```Bash
yum install -y git
```

Next, the repository can be clone using the following command:

```Bash
git clone https://github.com/beloglazov/openstack-centos-kvm-glusterfs.git
```

Then, we can proceed to continue the configuration using the scripts contained in the cloned Git
repository. As described above, the starting point is the directory called `01-network-gateway`.

```Bash
cd openstack-centos-kvm-glusterfs/01-network-gateway
```

All the scripts described below can be run by executing `./<script name>.sh` on the command line.


(@) `01-iptables-nat.sh`

This script flushes all the default `iptables` rules to open all ports. This is acceptable for
testing; however, it is not recommended for production environments due to security concerns. Then,
the script sets up NAT using `iptables` by forwarding packets from eth1 (the local network
interface) through eth0. The last stage is saving the defined `iptables` rules restarting the service.

```Bash
# Flush the iptables rules.
iptables -F
iptables -t nat -F
iptables -t mangle -F

# Set up packet forwarding for NAT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -o eth1 -j ACCEPT

# Save the iptables configuration into a file and restart iptables
service iptables save
service iptables restart
```

(@) `02-ip-forward.sh`

By default, IP packet forwarding is disabled in CentOS; therefore, it is necessary to enable it by
modifying the `/etc/sysctl.conf` configuration file. This is done by the `02-ip-forward.sh` script
as follows:

```Bash
# Enable IP packet forwarding
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' \
    /etc/sysctl.conf

# Restart the network service
service network restart
```

(@) `03-copy-hosts.sh`

This script copies the `hosts` file from the `config` directory to `/etc` locally, as well to all
the other hosts: the remaining compute hosts and the controller. The `hosts` files defines a mapping
between the IP addresses of the hosts and host names. For convenience, prior to copying you may use
the `ssh-copy-id` program to copy the public key to the other hosts for password-less SSH access.
Once the `hosts` file is copied to all the hosts, they can be accessed by using their respective
host names instead of the IP addresses.

```Bash
# Copy the hosts file into the local configuration
cp ../config/hosts /etc/

# Copy the hosts file to the other nodes.
scp ../config/hosts root@compute2:/etc/
scp ../config/hosts root@compute3:/etc/
scp ../config/hosts root@compute4:/etc/
scp ../config/hosts root@controller:/etc/

```

From this point, all the installation steps on any host can be performed remotely over SSH.


### GlusterFS Distributed Replicated Storage

In this section, we describe how to set up distributed replicated storage using GlusterFS.

#### 02-glusterfs-all (all nodes)

The steps discussed in this section need to be run on all the hosts. The easiest way to manage
multi-node installation is to SSH into all the hosts from another machine using separate terminals.
This way the hosts can be conveniently managed from a single machine. Before applying further
installation, it is necessary to run the following commands:

```Bash
yum update -y
yum install -y git
git clone https://github.com/beloglazov/openstack-centos-kvm-glusterfs.git

```

It is optional but might be useful to install other programs on all the hosts, such as `man`,
`nano`, or `emacs` for reading manuals and editing files.


(@) `01-iptables-flush.sh`

This script flushes all the default `iptables` rules to allow connections through all the ports. As
mentioned above, this is insecure and not recommended for production environments. For production it
is recommended to open the specific required ports.

```Bash
# Flush the iptables rules.
iptables -F

# Save the configuration and restart iptables
service iptables save
service iptables restart

```


(@) `02-selinux-permissive.sh`

This script switches SELinux^[http://en.wikipedia.org/wiki/Security-Enhanced_Linux] into the
permissive mode. By default, SELinux blocks certain operations, such as VM migrations. Switching
SELinux into the permissive mode is not recommended for production environments, but is acceptable
for testing purposes.

```Bash
# Set SELinux into the permissive mode
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
echo 0 > /selinux/enforce
```


(@) `03-glusterfs-install.sh`

This script installs GlusterFS services and their dependencies.

```Bash
# Install GlusterFS and its dependencies
yum -y install \
    openssh-server wget fuse fuse-libs openib libibverbs \
	http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-3.3.0-1.el6.x86_64.rpm \
	http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-fuse-3.3.0-1.el6.x86_64.rpm \
	http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-server-3.3.0-1.el6.x86_64.rpm
```


(@) `04-glusterfs-start.sh`

This script starts the GlusterFS service, and sets the service to start on the system start up.

```Bash
# Start the GlusterFS service
service glusterd restart
chkconfig glusterd on
```

#### 03-glusterfs-controller (controller)

The scripts described in this section need to be run only on the controller.


(@) `01-glusterfs-probe.sh`

This script probes the compute hosts to add them to a GlusterFS cluster.

```Bash
# Probe GlusterFS peer hosts
gluster peer probe compute1
gluster peer probe compute2
gluster peer probe compute3
gluster peer probe compute4
```


(@) `02-glusterfs-create-volume.sh`

This scripts creates a GlusterFS volume out of bricks exported by the compute hosts mounted to
`/export/gluster` for storing VM instances. The created GlusterFS volume is replicated across all
the 4 compute hosts. Such replication provides fault tolerance, as if any of the compute hosts fail,
the VM instance data will be available from the remaining replicas. Compared to a Network File System
(NFS) exported by a single server, the complete replication provided by GlusterFS improves the read
performance, since all the read operations are local. This is important to enable efficient live
migration of VMs.

```Bash
# Create a GlusterFS volume replicated over 4 gluster hosts
gluster volume create vm-instances replica 4 \
    compute1:/export/gluster compute2:/export/gluster \
	compute3:/export/gluster compute4:/export/gluster

# Start the created volume
gluster volume start vm-instances
```


#### 04-glusterfs-all (all nodes)

The script described in this section needs to be run on all the hosts.


(@) `01-glusterfs-mount.sh`

This scripts adds a line to the `/etc/fstab` configuration file to automatically mount the GlusterFS
volume on the system start up to the `/var/lib/nova/instances` directory. The
`/var/lib/nova/instances` directory is the default location where OpenStack Nova stores the VM
instances related data. This directory must be shared be all the compute hosts to enable live
migration of VMs. The `mount -a` command re-mounts everything from the config file after it has been
modified.

```Bash
# Mount the GlusterFS volume
mkdir -p /var/lib/nova/instances
echo "localhost:/vm-instances /var/lib/nova/instances glusterfs defaults 0 0" >> /etc/fstab
mount -a
```


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
