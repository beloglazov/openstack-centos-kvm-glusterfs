#!/bin/sh

# This should be run on compute1

gluster peer probe compute2
gluster peer probe compute3
gluster peer probe compute4
