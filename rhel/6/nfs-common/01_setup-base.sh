#!/bin/bash
#
# rhel6
#

set -e

chkconfig --list rpcbind
sudo chkconfig rpcbind on
chkconfig --list rpcbind

service rpcbind status || sudo service rpcbind start

exit 0
