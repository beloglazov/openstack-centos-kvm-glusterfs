#!/bin/sh

virsh migrate --live $1 qemu+ssh://$2/system
