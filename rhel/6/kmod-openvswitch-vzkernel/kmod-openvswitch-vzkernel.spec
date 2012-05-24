%define tmp_file "/tmp/rpm.kmod-kpkg.%(whoami).tmp"
%define kpkg_name vzkernel
%define kpkg_devel_name %{kpkg_name}-devel
%define kernel_version %(rpm -qi %{kpkg_devel_name} | egrep ^Version > %{tmp_file} && awk '{print $3}' %{tmp_file} | sort -r | head -1)
%define kernel_release %(rpm -qi %{kpkg_devel_name} | egrep ^Release > %{tmp_file} && awk '{print $3}' %{tmp_file} | sort -r | head -1)
%define kernel_variant %{kernel_version}-%{kernel_release}
%define kernel_source_dir %(rpm -ql %{kpkg_devel_name}-%{kernel_variant} | egrep /usr/src/kernels/${kernel_variant} > %{tmp_file} && head -1 %{tmp_file})
%define kernel_lib_dir %(rpm -ql %{kpkg_name}-%{kernel_variant} | grep /lib/modules/ > %{tmp_file} && head -1 %{tmp_file})
%define kernel_lib_version %(basename %{kernel_lib_dir})

%define kernelversion %{kernel_lib_version}

%define oname openvswitch
%define oname_base_uri http://openvswitch.org/releases

Name: kmod-%{oname}-%{kpkg_name}
Version: 1.4.1
Release: 1%{?dist}
Summary: Open vSwitch kernel module
Group: System/Kernel
License: GPLv2
URL: http://openvswitch.org/
Source:  %{oname_base_uri}/%{oname}-%{version}.tar.gz
Requires: module-init-tools
Requires: vzkernel

%description
Open vSwitch Linux kernel module.

%prep
[ -f ${RPM_SOURCE_DIR}/%{oname}-%{version}.tar.gz ] || {
  curl -o ${RPM_SOURCE_DIR}/%{oname}-%{version}.tar.gz -O %{oname_base_uri}/%{oname}-%{version}.tar.gz
}
[ -d %{name}-%{version} ] || {
  tar zxvf ${RPM_SOURCE_DIR}/%{oname}-%{version}.tar.gz -C ${RPM_BUILD_DIR}/
  mv %{oname}-%{version} %{name}-%{version}
}
%setup -T -D

%build
./configure --with-linux='/lib/modules/%{kernelversion}/build'
make -C datapath/linux

%install
[ -d ${RPM_BUILD_ROOT}/lib/modules/%{kernelversion}/extra/%{oname} ] || mkdir -p ${RPM_BUILD_ROOT}/lib/modules/%{kernelversion}/extra/%{oname}
rsync -aHA `pwd`/datapath/linux/*.ko ${RPM_BUILD_ROOT}/lib/modules/%{kernelversion}/extra/%{oname}/

%clean
rm -rf ${RPM_BUILD_ROOT}

#           install    upgrade  uninstall
# %pre      $1 == 1   $1 == 2   (N/A)
# %post     $1 == 1   $1 == 2   (N/A)
# %preun    (N/A)     $1 == 1   $1 == 0
# %postun   (N/A)     $1 == 1   $1 == 0

%post
echo "Adding any weak-modules"
cat <<EOS | /sbin/weak-modules --add-modules
/lib/modules/%{kernelversion}/extra/%{oname}/brcompat_mod.ko
/lib/modules/%{kernelversion}/extra/%{oname}/openvswitch_mod.ko
EOS

%prerun
if [ "$1" = "0" ]; then     # $1 = 0 for uninstall
  echo "Removing any linked weak-modules"
  cat <<EOS | /sbin/weak-modules --remove-modules
/lib/modules/%{kernelversion}/extra/%{oname}/brcompat_mod.ko
/lib/modules/%{kernelversion}/extra/%{oname}/openvswitch_mod.ko
EOS
fi

%files
%defattr(-,root,root)
/lib/modules/%{kernelversion}/extra/%{oname}/brcompat_mod.ko
/lib/modules/%{kernelversion}/extra/%{oname}/openvswitch_mod.ko

%changelog
