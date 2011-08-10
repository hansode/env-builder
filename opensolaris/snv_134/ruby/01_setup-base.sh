#!/bin/sh -e

pkgs="
 ruby-18
"

(cd ../gmake/ && make)
(cd ../gcc/   && make)

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
  pkg contents ${pkg}
done
