#!/bin/sh

pandoc \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../openstack-centos-kvm-glusterfs-guide.rst \
    openstack-centos-kvm-glusterfs-guide.md

sed -i 's/openstack-software-diagram.png/..\/..\/..\/raw\/master\/doc\/src\/openstack-software-diagram.png/g' \
    ../openstack-centos-kvm-glusterfs-guide.rst
