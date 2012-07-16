#!/bin/sh

# Generate an admin token for Keystone and save it into
# ./keystone-admin-token
openssl rand -hex 10 > keystone-admin-token
