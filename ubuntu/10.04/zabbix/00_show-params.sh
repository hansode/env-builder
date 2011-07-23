#!/bin/bash

. ./_config

for deb_pkg in ${deb_pkgs}; do
  echo ... ${deb_pkg}
  sudo debconf-show  ${deb_pkg}
done
