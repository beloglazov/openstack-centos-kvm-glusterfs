#!/bin/sh

# this script accepts an ip address of the instance as a parameter
ssh -i test.pem -l ubuntu $1
