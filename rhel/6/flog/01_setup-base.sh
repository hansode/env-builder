#!/bin/sh

. ./_common.sh

###

[ -f flog_${flog_deb_version}_${arch}.deb ] || \
  curl -O http://ftp.jaist.ac.jp/pub/Linux/ubuntu//pool/universe/f/flog/flog_${flog_deb_version}_${arch}.deb
