#!/bin/sh

# This script accepts a volume ID as a parameter

nova volume-attach ubuntu $1 /dev/vdc
