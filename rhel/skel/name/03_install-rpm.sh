#!/bin/bash

set -e

. ./_common.sh

arch=*86
uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild

#local_rpm_pkg_paths="
#  ${rpmbuild_dir}/RPMS/${arch}/name-utils-${name_version}-1.el6.${arch}.rpm
#  ${rpmbuild_dir}/RPMS/${arch}/name-km-${uname_r}-${name_version}-1.el6.${arch}.rpm
#"

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
