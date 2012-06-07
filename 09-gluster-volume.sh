#!/bin/sh

gluster volume create kvm-storage replica 3 ibm1:/export/gluster ibm2:/export/gluster ibm3:/export/gluster
gluster volume start kvm-storage

