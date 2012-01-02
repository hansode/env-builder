#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 make
 git-core
 screen
"

dpkg -l gpgv >/dev/null || {
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y install gpgv
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
}

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

exit 0
