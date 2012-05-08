#!/bin/bash

set -e

. ./_common.sh

#for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
#  local_rpm_pkg=$(basename ${local_rpm_pkg_path})
#  echo ${local_rpm_pkg_path}
#  rpm -ql ${local_rpm_pkg%%.rpm} >/dev/null || {
#    sudo rpm -ivh ${local_rpm_pkg_path}
#  }
#done

#sudo rpm -Uvh --force ${local_rpm_pkg_paths}


#chkconfig --list name
#sudo chkconfig name on
#chkconfig --list name
