#!/bin/sh -e

pkgs="
 git
"

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
  pkg contents ${pkg}
done
