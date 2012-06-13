#!/bin/bash

set -e

pkgs="
 rpm-build
 perl-ExtUtils-MakeMaker
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done
