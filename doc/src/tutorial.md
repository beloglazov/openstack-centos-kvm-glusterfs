% Step-by-Step Guide to Installing OpenStack on CentOS Using the KVM Hypervisor and GlusterFS
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

# Existing OpenStack Automated Installation Tools

- DevStack^[http://devstack.org/]
- Puppet / Chef^[http://docs.openstack.org/trunk/openstack-compute/admin/content/openstack-compute-deployment-tool-with-puppet.html]
- Difference From our Approach

# Step-by-Step Guide to Installing OpenStack

## Hardware Setup

- Servers
- Network setup

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
