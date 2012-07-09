#!/bin/sh

nova-manage network create demonet 10.0.0.0/24 1 256 --bridge=demonetbr0
