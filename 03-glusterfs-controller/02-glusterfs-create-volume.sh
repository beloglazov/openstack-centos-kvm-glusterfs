#!/bin/sh

# Create a gluster volume replicated over 4 gluster hosts
gluster volume create vm-instances replica 4 compute1:/export/gluster compute2:/export/gluster compute3:/export/gluster compute4:/export/gluster

# Start the created volume
gluster volume start vm-instances
