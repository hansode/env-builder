#!/bin/bash

pkgs="
 sysvinit
 initscripts
 chkconfig
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done
