#!/bin/sh

set -e

pkgs="
 gcc
 make
 automake
 flex
 rpm-build
 kernel-devel
 libxslt
 fakeroot
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done
