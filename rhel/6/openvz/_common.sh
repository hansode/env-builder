openvz_version=x.y.z

arch=$(arch)
case ${arch} in
*86) arch=*86 ;;
esac

uopenvz_r=$(uname -r | sed 's,-,_,g')
rpmbuild_dir=${HOME}/rpmbuild

#local_rpm_pkg_paths="
#  ${rpmbuild_dir}/RPMS/${arch}/name-utils-${openvz_version}-1.el6.${arch}.rpm
#  ${rpmbuild_dir}/RPMS/${arch}/name-km-${uopenvz_r}-${openvz_version}-1.el6.${arch}.rpm
#"
