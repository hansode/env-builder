#!/bin/bash

set -e

pkgs="
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done

# (cd ../fakeroot/ && make)
