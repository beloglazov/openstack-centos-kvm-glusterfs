#!/bin/sh

echo "#!/bin/sh
modprobe fuse" > /etc/sysconfig/modules/fuse.modules
chmod +x /etc/sysconfig/modules/fuse.modules
