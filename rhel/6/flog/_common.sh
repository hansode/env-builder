flog_version=1.8
flog_deb_version=${flog_version}-3
flog_rpm_version=${flog_version}-4


rpmbuild_dir=${HOME}/rpmbuild

arch=$(arch)
case ${arch} in
x86_64)
  arch=amd64
  ;;
*)
  arch=i386
  ;;
esac

local_rpm_pkg_paths="
 ./flog-${flog_rpm_version}.*.rpm
"
