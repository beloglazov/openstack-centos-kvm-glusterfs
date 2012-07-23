#!/bin/sh

pandoc \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../openstack-centos-kvm-glusterfs-guide.rst \
    openstack-centos-kvm-glusterfs-guide.md


    # --standalone \
    # --smart \
