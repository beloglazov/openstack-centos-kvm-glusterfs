#!/bin/sh

pandoc \
    --number-sections \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../openstack-centos-kvm-glusterfs-guide.epub \
    openstack-centos-kvm-glusterfs-guide.md
