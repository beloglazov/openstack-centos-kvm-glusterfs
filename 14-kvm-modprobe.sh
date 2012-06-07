#!/bin/sh

echo "#!/bin/sh
modprobe kvm" > /etc/sysconfig/modules/kvm.modules
chmod +x /etc/sysconfig/modules/kvm.modules
/etc/sysconfig/modules/kvm.modules
