#!/bin/bash
#
# rhel6
#

set -e

chkconfig --list rpcbind
chkconfig rpcbind on
chkconfig --list rpcbind

service rpcbind status || service rpcbind start

exit 0
