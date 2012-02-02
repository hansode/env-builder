#!/bin/sh

. ./_common.sh

[ -d rubygems-${rubygems_version} ] || exit 1

cd rubygems-${rubygems_version}

sudo /usr/local/sbin/checkinstall --nodoc --type=rpm -y ruby setup.rb
