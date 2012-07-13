#!/bin/sh

nova keypair-add test > ../config/test.pem
chmod 600 ../config/test.pem
