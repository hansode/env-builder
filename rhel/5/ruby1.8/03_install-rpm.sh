#!/bin/sh

. ./_common.sh

arch=*86
uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=/usr/src/redhat

local_rpm_pkg_paths="
   ${rpmbuild_dir}/RPMS/${arch}/ruby-${ruby_version}-1.${arch}.rpm
"

sudo rpm -Uvh -Uvh --nomd5 ${local_rpm_pkg_paths}
