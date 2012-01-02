#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 rubygems/natty
 rubygems1.8/natty
"

(cd ../ubuntu-natty && make)

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

exit 0
