#!/bin/bash

set -e

pkgs="
 kernel-devel
 gcc
 openssl-devel
 redhat-rpm-config
 dracut-kernel
"
# The macro "%kernel_module_package_buildreqs" is defined in the file "/usr/lib/rpm/redhat/macros" from package redhat-rpm-config, 
# when installing kmod-openvswitch, dracut-kernel is needed.

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || yum install -y ${pkg}
done

(cd ../rpmbuild/ && make)
