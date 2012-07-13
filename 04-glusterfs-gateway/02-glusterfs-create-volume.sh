#!/bin/sh

# This should be run on compute1

gluster volume create vm-instances replica 4 compute1:/export/gluster compute2:/export/gluster compute3:/export/gluster compute4:/export/gluster
gluster volume start vm-instances
