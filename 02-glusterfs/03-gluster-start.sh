#!/bin/sh

# This should be run on the compute hosts

service glusterd restart
chkconfig glusterd on
