#!/bin/sh

. ./_common.sh

arch=$(arch)
uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild


#/root/rpmbuild/RPMS/i686/lxc-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-devel-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-debuginfo-0.7.5-1.i686.rpm

local_rpm_pkg_paths="
  ${rpmbuild_dir}/RPMS/${arch}/lxc-${lxc_version}-1.i686.rpm
"

for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
  echo ${local_rpm_pkg_path}
  local_rpm_pkg=$(basename ${local_rpm_pkg_path})
  rpm -ql ${local_rpm_pkg%%.rpm} >/dev/null || {
    rpm -ivh ${local_rpm_pkg_path}
  }
done

[ -d /var/lib/lxc ] || mkdir /var/lib/lxc
