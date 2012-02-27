#!/bin/bash
#

pkgs="
 make
 git
 screen
 lv
 rsync

 vim
 emacs
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done

exit 0