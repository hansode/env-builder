#!/bin/sh -e

pkgs="
 gcc-3
"

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
done
