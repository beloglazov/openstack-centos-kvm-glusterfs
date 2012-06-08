#!/bin/sh

echo "#!/bin/sh
modprobe kvm
modprobe kvm-intel" > /etc/sysconfig/modules/kvm.modules
chmod +x /etc/sysconfig/modules/kvm.modules
/etc/sysconfig/modules/kvm.modules
