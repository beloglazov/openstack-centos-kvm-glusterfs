#!/bin/sh

openstack-db --service nova --init
openstack-db --service glance --init

