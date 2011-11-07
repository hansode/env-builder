#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 nfs-utils
"
yum install -y ${rpm_pkgs}

service rpcbind status || service rpcbind start

exit 0
