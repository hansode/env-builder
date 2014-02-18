#!/bin/bash

. ./_common.sh

s3cmd_tarball=s3cmd-${s3cmd_ver}.tar.gz

[ -f ${s3cmd_tarball} ] || {
  wget -O ${s3cmd_tarball} "http://sourceforge.net/projects/s3tools/files/latest/download?source=files"
  tar zxvf ${s3cmd_tarball}
}

extracted_dir=$(for i in s3cmd-*; do [ -d $i ] && echo $i; done | sort -r | head -1)
[ -z "${extracted_dir}" ] && exit 1

which s3cmd || {
  cd ${extracted_dir}
  python setup.py install
  which s3cmd
}
