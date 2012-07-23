#!/bin/sh

pandoc \
    --smart \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../../README.rst \
    readme-intro.md \
    abstract.txt \
    openstack-centos-kvm-glusterfs-guide.md

sed -i 's/openstack-software-diagram.png/\/beloglazov\/openstack-centos-kvm-glusterfs\/raw\/master\/doc\/src\/openstack-software-diagram.png/g' \
    ../../README.rst
