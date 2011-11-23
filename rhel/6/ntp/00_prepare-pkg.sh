#!/bin/sh

set -e

pkgs="
 ntp
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done
