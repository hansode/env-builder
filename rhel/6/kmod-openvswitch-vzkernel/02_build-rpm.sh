#!/bin/bash

set -e

. ./_common.sh

#[ -d name-${openvswitch_version} ] || exit 1

#cd name-${openvswitch_version}
#(
#for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
#  [ -f ${local_rpm_pkg_path} ] || exit 1
#done
#) || make rpm


rpmbuild -bb --target=${arch} ./kmod-openvswitch-vzkernel.spec
