#!/bin/bash
#
# rhel6
#

set -e

chkconfig --list ucarp
chkconfig ucarp on
chkconfig --list ucarp

exit 0
