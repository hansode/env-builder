#!/bin/bash

set -e

. ./_common.sh

[ -d openvswitch-${openvswitch_version} ] || exit 1

rsync -a ./openvswitch-${openvswitch_version}.tar.gz $HOME/rpmbuild/SOURCES/

cd openvswitch-${openvswitch_version}

rpmbuild -bb rhel/openvswitch.spec
rpmbuild -bb rhel/openvswitch-kmod-rhel6.spec
