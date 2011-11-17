#!/bin/sh

. ./_common.sh

###
[ -f drbd-${drbd_version}.tar.gz ] || \
  curl -O http://oss.linbit.com/drbd/8.4/drbd-${drbd_version}.tar.gz

[ -d drbd-${drbd_version} ] || tar zxvf drbd-${drbd_version}.tar.gz
cd drbd-${drbd_version}
[ -f Makefile ] || ./configure
