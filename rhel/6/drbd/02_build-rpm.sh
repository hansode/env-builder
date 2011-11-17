#!/bin/sh

. ./_common.sh

[ -d drbd-${drbd_version} ] || exit 1

cd drbd-${drbd_version}
make rpm
make km-rpm
