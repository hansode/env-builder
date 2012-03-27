#!/bin/bash

pkgs="
"

(cd ../rubygems && make)

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done
