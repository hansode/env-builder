#!/bin/sh

. ./_common.sh

[ -f flog-${flog_rpm_version}.${arch}.rpm ] || fakeroot alien --to-rpm ./flog_${flog_deb_version}_${arch}.deb
