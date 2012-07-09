#!/bin/sh

# before installation, it is necessary to add the following kernel boot options:
# console=tty0 console=ttyS0

virt-install --name centos --vcpus 1 --ram 1024 --disk path=/kvm-storage/centos.img,size=10 --network bridge:br0 --arch i686 -c /kvm-storage/CentOS-6.2-i386-minimal.iso --graphics none --boot kernel_args="console=tty0 console=ttyS0"
#virt-install --name centos --vcpus 2 --ram 1500 --disk path=/kvm-storage/centos.img,size=10 --network bridge:br0 --arch i686 -c /kvm-storage/CentOS-6.2-i386-minimal.iso --graphics none --boot kernel_args="console=tty0 console=ttyS0,115200"
#virt-install --name centos --vcpus 2 --ram 1500 --disk path=/kvm-storage/centos.img,size=10 --network bridge:br0 --arch i686 -l /kvm-storage/CentOS-6.2-i386-minimal.iso -x console=ttyS0,115200 --graphics none
