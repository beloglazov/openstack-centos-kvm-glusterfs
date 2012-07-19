#!/bin/sh

pandoc --smart --table-of-contents --number-sections --bibliography=src/bibliography.bib --csl=src/ieee.csl --output=openstack-centos-kvm-glusterfs-guide.pdf src/openstack-centos-kvm-glusterfs-guide.md
