#!/bin/sh

pandoc --smart --table-of-contents --number-sections --bibliography=bibliography.bib --csl=ieee.csl --output=../openstack-centos-kvm-glusterfs-guide.pdf openstack-centos-kvm-glusterfs-guide.md
