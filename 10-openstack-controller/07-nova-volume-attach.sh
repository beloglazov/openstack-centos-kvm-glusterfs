#!/bin/sh

# Attach the created volume to an Ubuntu VM instance as /dev/vdc. This
# script accepts a volume ID as a parameter.
nova volume-attach ubuntu $1 /dev/vdc
