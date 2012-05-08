lxc_version=0.7.5

arch=$(arch)
case ${arch} in
*86) arch=*86 ;;
esac

uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild

#/root/rpmbuild/RPMS/i686/lxc-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-devel-0.7.5-1.i686.rpm
#/root/rpmbuild/RPMS/i686/lxc-debuginfo-0.7.5-1.i686.rpm

local_rpm_pkg_paths="
  ${rpmbuild_dir}/RPMS/${arch}/lxc-${lxc_version}-1.${arch}.rpm
"
