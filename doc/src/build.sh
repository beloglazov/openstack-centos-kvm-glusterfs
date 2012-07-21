#!/bin/sh

pandoc \
    --smart \
    --table-of-contents \
    --number-sections \
    --template=template.tex \
    --include-before-body=abstract-begin.tex \
    --include-before-body=abstract.txt \
    --include-before-body=abstract-end.tex \
    --variable=geometry:textwidth=370pt \
    --variable=affilation:"`cat affiliation.tex`" \
    --variable=thanks:"`cat thanks.tex`" \
    --bibliography=bibliography.bib --csl=ieee.csl \
    --output=../openstack-centos-kvm-glusterfs-guide.pdf \
    openstack-centos-kvm-glusterfs-guide.md
