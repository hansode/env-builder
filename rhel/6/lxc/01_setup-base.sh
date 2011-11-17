#!/bin/bash

set -e

. ./_common.sh

[ -f lxc-${lxc_version}.tar.gz ] || \
  curl -O http://lxc.sourceforge.net/download/lxc/lxc-${lxc_version}.tar.gz
[ -d lxc-${lxc_version} ] || tar zxvf lxc-${lxc_version}.tar.gz
cd lxc-${lxc_version}

[ -f Makefile ] || ./configure
