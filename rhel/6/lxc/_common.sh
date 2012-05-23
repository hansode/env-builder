lxc_version=0.7.5

arch=${arch:-$(arch)}
case ${arch} in
x86_64)
  arch=amd64
  ;;
*)
  arch=i386
  ;;
esac

#uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild

#/root/rpmbuild/RPMS/i686/lxc-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-devel-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-debuginfo-0.7.5-1.i686.rpm

local_rpm_pkg_paths="
  ${rpmbuild_dir}/RPMS/${arch}/lxc-${lxc_version}-1.${arch}.rpm
"
