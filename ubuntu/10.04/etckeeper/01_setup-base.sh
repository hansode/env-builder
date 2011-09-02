#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 etckeeper
"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

exit 0
