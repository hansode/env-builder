#!/bin/bash

. ./_common.sh

(
for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
  [ -f ${local_rpm_pkg_path} ] || exit 1
done
) || rpmbuild -ta alien_${alien_version}.tar.gz
