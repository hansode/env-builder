#!/bin/bash

set -e
set -x

. ./_common.sh

[ -d lxc-${lxc_version} ] || exit 1

cd lxc-${lxc_version}
(
for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
  [ -f ${local_rpm_pkg_path} ] || exit 1
done
) || make rpm
