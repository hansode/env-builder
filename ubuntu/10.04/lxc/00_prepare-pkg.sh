#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 lxc/natty
 linux-image-2.6.38-10-generic
"

(cd ../ubuntu-natty/ && make)
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

exit 0
