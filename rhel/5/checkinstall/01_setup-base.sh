#!/bin/sh

. ./_common.sh

###
[ -f checkinstall-${checkinstall_version}.i386.rpm ] || \
 curl -O http://asic-linux.com.mx/~izto/checkinstall/files/rpm/checkinstall-${checkinstall_version}.i386.rpm

rpm -ql checkinstall >/dev/null || {
  sudo rpm -ivh checkinstall-${checkinstall_version}.i386.rpm
}
