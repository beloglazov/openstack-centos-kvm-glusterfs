#!/bin/sh

gluster volume create kvm-storage replica 3 compute1:/export/gluster compute2:/export/gluster compute3:/export/gluster
gluster volume start kvm-storage

