#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 ruby-bundler/oneiric
"

(cd ../ubuntu-natty && make)

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

exit 0
