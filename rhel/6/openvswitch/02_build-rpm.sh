#!/bin/bash

set -e
set -x

. ./_common.sh

[ -d openvswitch-${openvswitch_version} ] || exit 1

[ -f $HOME/rpmbuild/SOURCES/openvswitch-${openvswitch_version}.tar.gz ] || {
  rsync -a ./openvswitch-${openvswitch_version}.tar.gz $HOME/rpmbuild/SOURCES/
}

cd openvswitch-${openvswitch_version}
(
for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
  [ -f ${local_rpm_pkg_path} ] || exit 1
done
) || (
 rpmbuild -bb rhel/openvswitch.spec
 rpmbuild -bb rhel/openvswitch-kmod-rhel6.spec
)
