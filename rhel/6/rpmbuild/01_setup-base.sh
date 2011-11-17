#!/bin/sh

set -e

rpmbuild_dir=${HOME}/rpmbuild
rpmmacro_file=${HOME}/.rpmmacros

[ -d ${rpmbuild_dir} ] || mkdir ${rpmbuild_dir}

for subdir in ${rpmbuild_dir}/{BUILD,SOURCES,SPECS,SRPMS,RPMS}; do
  [ -d ${subdir} ] || mkdir ${subdir}
done

[ -f ${rpmmacro_file} ] || {
  echo "%_topdir $HOME/rpmbuild" > ${rpmmacro_file}
}
