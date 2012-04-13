#!/bin/bash
#

pkgs="
  curl
  netcat
  inetutils
  bind
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done

exit 0
