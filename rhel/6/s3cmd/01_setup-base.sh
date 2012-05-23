#!/bin/bash

set -e

. ./_common.sh

###
#[ -f name-${s3cmd_version}.tar.gz ] || \
# curl -O http://ftp.exmaple.com/name/x.y/name-${s3cmd_version}.tar.gz

#[ -d name-${s3cmd_version} ] || tar zxvf name-${s3cmd_version}.tar.gz
#cd name-${s3cmd_version}
#[ -f Makefile ] || ./configure

[ -f s3tools.repo ] || curl -O http://s3tools.org/repo/RHEL_6/s3tools.repo
