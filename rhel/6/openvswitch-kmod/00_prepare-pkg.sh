#!/bin/sh

set -e

pkgs="
 kernel-devel
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done

(cd ../rpmbuild/ && make)
