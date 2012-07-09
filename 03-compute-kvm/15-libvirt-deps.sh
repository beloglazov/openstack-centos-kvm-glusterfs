#!/bin/sh

yum -y install avahi dmidecode

service messagebus restart
service avahi-daemon restart

chkconfig messagebus on
chkconfig avahi-daemon on
#!/bin/sh

yum -y install kvm libvirt libvirt-python python-virtinst qemu-kvm qemu-kvm-tools
