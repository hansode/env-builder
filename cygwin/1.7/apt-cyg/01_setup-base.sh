#!/bin/bash
#
#
set -e

[ -x /usr/bin/apt-cyg ] || {
  wget http://apt-cyg.googlecode.com/svn/trunk/apt-cyg
  mv apt-cyg /usr/bin
  chmod +x /usr/bin/apt-cyg
}

alias_aptcyg="alias apt-cyg='apt-cyg -u'"
egrep -q "^${alias_aptcyg}" ~/.bashrc || {
  echo ${alias_aptcyg} >> ~/.bashrc
}
