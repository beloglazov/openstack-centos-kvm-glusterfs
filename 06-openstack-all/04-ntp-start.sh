#!/bin/sh

# Start the NTP service
service ntpdate restart
chkconfig ntpdate on
