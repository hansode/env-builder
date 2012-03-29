#!/bin/bash

pkgs="
 openssh
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done
