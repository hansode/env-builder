#!/bin/sh

pkgs="
  rpm-build
"

for pkg in ${pkgs}; do
  rpm -ql ${pkgs} >/dev/null || yum install -y ${pkg}
done
