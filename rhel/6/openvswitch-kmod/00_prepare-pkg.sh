#!/bin/sh

set -e

pkgs="
 kernel-devel
 gcc
 openssl-devel
 redhat-rpm-config
"
# The macro "%kernel_module_package_buildreqs" is defined in the file "/usr/lib/rpm/redhat/macros" from package redhat-rpm-config, 

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done

(cd ../rpmbuild/ && make)
