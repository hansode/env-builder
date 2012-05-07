#!/bin/sh

. ./_common.sh

###
[ -f openvswitch-${openvswitch_version}.tar.gz ] || \
 curl -O http://openvswitch.org/releases/openvswitch-${openvswitch_version}.tar.gz

[ -d openvswitch-${openvswitch_version} ] || tar zxvf openvswitch-${openvswitch_version}.tar.gz
