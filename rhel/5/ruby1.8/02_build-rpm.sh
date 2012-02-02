#!/bin/sh

. ./_common.sh

[ -d ruby-${ruby_version} ] || exit 1

cd ruby-${ruby_version}

make
sudo /usr/local/sbin/checkinstall --fstrans=no --nodoc --type=rpm -y
