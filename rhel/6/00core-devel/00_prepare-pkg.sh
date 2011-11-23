#!/bin/bash
#
# rhel6
#

set -e

pkgs="
 make
 git
 screen
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done

exit 0
