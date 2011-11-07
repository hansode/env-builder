#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 nfs-utils
"
yum install -y ${rpm_pkgs}

chkconfig        rpcbind on
chkconfig --list rpcbind
service rpcbind status || service rpcbind start

exit 0
