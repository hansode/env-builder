#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 make
 git
"
yum install -y ${rpm_pkgs}

exit 0
