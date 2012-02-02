#!/bin/sh

. ./_common.sh

###
[ -f ruby-${ruby_version}.tar.gz ] || \
 curl -O http://core.ring.gr.jp/archives/lang/ruby/1.8/ruby-${ruby_version}.tar.gz

[ -d ruby-${ruby_version} ] || tar zxvf ruby-${ruby_version}.tar.gz
cd ruby-${ruby_version}
[ -f Makefile ] || ./configure --prefix=/usr
