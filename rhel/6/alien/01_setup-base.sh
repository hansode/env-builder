#!/bin/sh

. ./_common.sh

###
[ -f alien_${alien_version}.tar.gz ] || \
  curl -O http://ftp.debian.org/debian/pool/main/a/alien/alien_${alien_version}.tar.gz
