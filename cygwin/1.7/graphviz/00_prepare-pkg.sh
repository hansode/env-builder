#!/bin/bash
#
#
set -e

. ./_common.sh


pkgs="
"

which dot || {
  installer_file=graphviz-${graphviz_ver}.msi
  [ -f ${installer_file} ] || wget  http://www.graphviz.org/pub/graphviz/stable/windows/${installer_file}
  # msiexec.exe /a ./${installer_file}
  cygstart .
}
