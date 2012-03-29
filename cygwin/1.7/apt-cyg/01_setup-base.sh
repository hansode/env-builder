#!/bin/bash
#
#
set -e

[ -x /usr/bin/apt-cyg ] || {
  wget http://apt-cyg.googlecode.com/svn/trunk/apt-cyg
  mv apt-cyg /usr/bin
  chmod +x /usr/bin/apt-cyg
}

# set mirror site.
sed -i "s,mirror=ftp://mirror.mcs.anl.gov/pub/cygwin,mirror=http://ftp.iij.ad.jp/pub/cygwin/," /usr/bin/apt-cyg

alias_aptcyg="alias apt-cyg='apt-cyg -u'"
egrep -q "^${alias_aptcyg}" ~/.bashrc || {
  echo ${alias_aptcyg} >> ~/.bashrc
}
