#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 python-software-properties/natty
"

(cd ../ubuntu-natty/ && make)
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

sudo add-apt-repository ppa:dajhorn/zfs
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zfs
