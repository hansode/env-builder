#!/bin/sh -e

# pkg search `which iozone`

pkgs="
 iozone
"

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
  pkg contents ${pkg}
done
