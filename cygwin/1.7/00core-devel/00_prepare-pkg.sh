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

 gcc-core
 gcc-g++
"

for pkg in ${pkgs}; do
  apt-cyg show | grep -q ${pkg} >/dev/null || apt-cyg install ${pkg}
done

# /usr/bin/apt-cyg: line 402: /etc/postinstall/gcc.sh: Permission denied
# /usr/bin/apt-cyg: line 402: /etc/postinstall/gcc-g++.sh: Permission denied

[ -f /etc/postinstall/gcc.sh.done ] && bash /etc/postinstall/gcc.sh.done
[ -f /etc/postinstall/gcc-g++.sh.done ] && bash /etc/postinstall/gcc-g++.sh.done

exit 0
