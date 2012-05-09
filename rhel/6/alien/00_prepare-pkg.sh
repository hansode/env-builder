#!/bin/bash

set -e

pkgs="
 rpm-build
 perl-ExtUtils-MakeMaker
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done
