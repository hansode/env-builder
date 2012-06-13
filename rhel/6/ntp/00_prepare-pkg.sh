#!/bin/sh

set -e

pkgs="
 ntp
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done
