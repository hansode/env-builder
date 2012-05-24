openvswitch_version=1.4.1

arch=${arch:-$(arch)}
case ${arch} in
i*86)   basearch=i386; arch=i686;;
x86_64) basearch=${arch};;
esac

#uname_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild

local_rpm_pkg_paths="
  ${rpmbuild_dir}/RPMS/${basearch}/kmod-openvswitch-vzkernel-${openvswitch_version}-1.el6.${basearch}.rpm
"
