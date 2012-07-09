#!/bin/sh

scp ../config/hosts /etc/

# For convenience, you may ssh-copy-id for password-less ssh access

# Please modify the following line according to actual hosts you have
scp ../config/hosts root@compute2:/etc/
scp ../config/hosts root@compute3:/etc/
scp ../config/hosts root@compute4:/etc/
scp ../config/hosts root@controller:/etc/
