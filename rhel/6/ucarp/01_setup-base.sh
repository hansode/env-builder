#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 ucarp
"

(cd ../epel-release && make)
yum install -y ${rpm_pkgs}

chkconfig        ucarp on
chkconfig --list ucarp

exit 0
