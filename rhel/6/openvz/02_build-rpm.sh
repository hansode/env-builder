#!/bin/bash

set -e

. ./_common.sh

#[ -d name-${openvz_version} ] || exit 1

#cd name-${openvz_version}
#(
#for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
#  [ -f ${local_rpm_pkg_path} ] || exit 1
#done
#) || make rpm

[ -f /etc/yum.repos.d/openvz.repo ] || \
  rsync -a ${vendor_dir}/openvz.repo /etc/yum.repos.d/openvz.repo
