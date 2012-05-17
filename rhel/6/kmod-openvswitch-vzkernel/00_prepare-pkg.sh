#!/bin/bash

set -e

(cd ../rpmbuild/ && make)
(cd ../openvz/ && make)

pkgs="
  vzkernel-devel
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done

