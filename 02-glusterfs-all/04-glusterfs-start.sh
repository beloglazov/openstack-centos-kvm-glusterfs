#!/bin/sh

# Start the GlusterFS service
service glusterd restart
chkconfig glusterd on
