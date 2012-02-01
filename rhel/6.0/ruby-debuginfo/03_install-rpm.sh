#!/bin/sh

. ./_common.sh

arch=*86*
uname_r=$(uname -r | sed 's,-,_,g')

local_rpm_pkg_paths="
 ${rpmbuild_dir}/RPMS/${arch}/ruby-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-debuginfo-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-devel-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-docs-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-irb-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-libs-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-rdoc-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-ri-${ruby_version}.el6.${arch}.rpm

 ${rpmbuild_dir}/RPMS/${arch}/ruby-static-${ruby_version}.el6.${arch}.rpm
 ${rpmbuild_dir}/RPMS/${arch}/ruby-tcltk-${ruby_version}.el6.${arch}.rpm
"

#for local_rpm_pkg_path in ${local_rpm_pkg_paths}; do
#  local_rpm_pkg=$(basename ${local_rpm_pkg_path})
#  echo ${local_rpm_pkg_path}
#  rpm -ql ${local_rpm_pkg%%.rpm} >/dev/null && {
#    sudo rpm -Uvh --force ${local_rpm_pkg_path}
#  } || {
#    sudo rpm -ivh ${local_rpm_pkg_path}
#  }
#done

sudo rpm -Uvh --force ${local_rpm_pkg_paths}
