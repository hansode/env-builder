#!/bin/sh

. ./_common.sh

###
[ -f rubygems-${rubygems_version}.tgz ] || \
 curl -O http://production.cf.rubygems.org/rubygems/rubygems-${rubygems_version}.tgz

[ -d rubygems-${rubygems_version} ] || tar zxvf rubygems-${rubygems_version}.tgz
