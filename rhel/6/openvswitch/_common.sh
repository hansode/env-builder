openvswitch_version=1.4.1

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

local_rpm_pkg_paths="
  ${rpmbuild_dir}/RPMS/${arch}/openvswitch-${openvswitch_version}-1.${arch}.rpm
  ${rpmbuild_dir}/RPMS/${arch}/kmod-openvswitch-${openvswitch_version}-1.el6.${arch}.rpm
"
