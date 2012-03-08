#!/bin/bash

. ./_common.sh

which nkf && exit 0

[ -f nkf-${nkf_ver}.tar.gz ] || {
  wget -O nkf-${nkf_ver}.tar.gz "http://sourceforge.jp/frs/redir.php?m=iij&f=%2Fnkf%2F48945%2Fnkf-${nkf_ver}.tar.gz"
  tar zxvf nkf-${nkf_ver}.tar.gz
}

cd nkf-${nkf_ver}
make && make test && make install

which nkf
