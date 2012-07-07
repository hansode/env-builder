#!/bin/bash

set -e

(cd ../rpmbuild/ && make)
(cd ../openvz/ && make)
(cd ../openvswitch/ && make build)

pkgs="
  vzkernel-devel
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done

