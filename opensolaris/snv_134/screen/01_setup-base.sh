#!/bin/sh -e

# pkg search `which git`

pkgs="
 git
"

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
done
