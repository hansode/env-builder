#!/bin/sh

set -e

pkgs="
 fakeroot
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done
