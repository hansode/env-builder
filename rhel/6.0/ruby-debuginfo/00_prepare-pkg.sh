#!/bin/sh

set -e

pkgs="
 rpm-build
 perl-ExtUtils-MakeMaker

 ncurses-devel
 gdbm-devel
 tcl-devel
 tk-devel
 libX11-devel
 autoconf
 db4-devel
 byacc
 bison
 compat-readline5-devel

 redhat-rpm-config
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done
