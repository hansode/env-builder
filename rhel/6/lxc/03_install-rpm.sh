#!/bin/bash

set -e

. ./_common.sh

for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
  echo ${local_rpm_pkg_path}
  local_rpm_pkg=$(basename ${local_rpm_pkg_path})
  rpm -ql ${local_rpm_pkg%%.rpm} >/dev/null || {
    rpm -ivh ${local_rpm_pkg_path}
  }
done

[ -d /var/lib/lxc ] || mkdir /var/lib/lxc
