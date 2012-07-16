#!/bin/sh

# Start the HTTPD service. The dashboard will be available at:
# http://localhost/dashboard
service httpd restart
chkconfig httpd on
