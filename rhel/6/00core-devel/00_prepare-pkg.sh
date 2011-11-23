#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 make
 git
 screen
"

for rpm_pkg in ${rpm_pkgs}; do
  rpm -ql ${rpm_pkg} || sudo yum install -y ${rpm_pkg}
done

exit 0
