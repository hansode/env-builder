#!/bin/bash

set -e

. ./_common.sh

#[ -d name-${s3cmd_version} ] || exit 1

#cd name-${s3cmd_version}
#(
#for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
#  [ -f ${local_rpm_pkg_path} ] || exit 1
#done
#) || make rpm

[ -f /etc/yum.repos.d/s3tools.repo ] || \
  rsync -a s3tools.repo /etc/yum.repos.d/s3tools.repo
