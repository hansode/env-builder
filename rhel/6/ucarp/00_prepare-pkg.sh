#!/bin/bash
#
# rhel6
#

set -e

pkgs="
 ucarp
"

(cd ../epel-release && make)

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkgs}
done

exit 0
