#!/bin/bash

set -e

pkgs="
 rpm-build
 libcap-devel
 docbook-utils
 kernel-devel
 gcc
 make
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done
