#!/bin/sh

glance index |grep $1| cut -d' ' -f1
