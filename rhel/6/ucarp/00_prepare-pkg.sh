#!/bin/bash
#
# rhel6
#

set -e

rpm_pkgs="
 ucarp
"

(cd ../epel-release && make)

for rpm_pkg in ${rpm_pkgs}; do
  rpm -ql ${rpm_pkg} >/dev/null || sudo yum install -y ${rpm_pkgs}
done

exit 0
