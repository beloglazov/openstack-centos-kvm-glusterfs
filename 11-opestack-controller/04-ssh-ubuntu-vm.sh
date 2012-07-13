#!/bin/sh

# This script accepts the IP address of the instance as a parameter

ssh -i ../config/test.pem -l ubuntu $1
