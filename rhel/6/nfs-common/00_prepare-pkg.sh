#!/bin/bash
#
# rhel6
#

set -e

pkgs="
 nfs-utils
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkgs}
done

exit 0
