#!/bin/bash

. ./_common.sh

[ -f s3cmd-${s3cmd_ver}.zip ] || {
  wget -O s3cmd-${s3cmd_ver}.zip "http://sourceforge.net/projects/s3tools/files/latest/download?source=files"
  mv -i "download@source=files" s3cmd-${s3cmd_ver}.tar.gz
  unzip s3cmd-${s3cmd_ver}.zip
}

extracted_dir=$(for i in s3cmd-*; do [ -d $i ] && echo $i; done | sort -r | head -1)
[ -z "${extracted_dir}" ] && exit 1

which s3cmd || {
  cd ${extracted_dir}
  python setup.py install
  which s3cmd
}
