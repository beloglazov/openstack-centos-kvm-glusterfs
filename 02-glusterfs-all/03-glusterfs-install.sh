#!/bin/sh

# Copyright 2012 Anton Beloglazov
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Install GlusterFS and its dependencies
yum -y install openssh-server wget fuse fuse-libs openib libibverbs http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/CentOS/epel-6Server/x86_64/glusterfs-3.3.1-1.el6.x86_64.rpm http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/CentOS/epel-6Server/x86_64/glusterfs-fuse-3.3.1-1.el6.x86_64.rpm http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/CentOS/epel-6Server/x86_64/glusterfs-server-3.3.1-1.el6.x86_64.rpm
