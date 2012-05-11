#!/bin/bash

set -e

. ./_common.sh

###
#[ -f name-${openvz_version}.tar.gz ] || \
# curl -O http://ftp.exmaple.com/name/x.y/name-${openvz_version}.tar.gz

#[ -d name-${openvz_version} ] || tar zxvf name-${openvz_version}.tar.gz
#cd name-${openvz_version}
#[ -f Makefile ] || ./configure

[ -f openvz.repo ] || curl -O http://download.openvz.org/openvz.repo
