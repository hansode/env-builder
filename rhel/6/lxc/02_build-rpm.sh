#!/bin/sh

. ./_common.sh

[ -d lxc-${lxc_version} ] || exit 1

cd lxc-${lxc_version}
#[ -f Makefile ] || ./configure
make rpm
