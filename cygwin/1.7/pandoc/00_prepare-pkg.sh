#!/bin/bash
#
#
set -e

. ./_common.sh


pkgs="
"

which pandoc || {
  wget http://pandoc.googlecode.com/files/pandoc-${pandoc_ver}-setup.exe
  chmod +x /pandoc-${pandoc_ver}-setup.exe
  ./pandoc-${pandoc_ver}-setup.exe
}
