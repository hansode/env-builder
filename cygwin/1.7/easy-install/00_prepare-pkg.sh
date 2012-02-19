#!/bin/bash

pkgs="
  python
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done
