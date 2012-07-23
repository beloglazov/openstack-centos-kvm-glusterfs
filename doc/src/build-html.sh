#!/bin/sh

pandoc \
    --standalone \
    --smart \
    --self-contained \
    --table-of-contents \
    --number-sections \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../openstack-centos-kvm-glusterfs-guide.html \
    openstack-centos-kvm-glusterfs-guide.md
