#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 dkms
 spl
 zlib1g-dev uuid-dev libblkid-dev libselinux-dev parted lsscsi
"

(cd ../ubuntu-natty/ && make)
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties/natty

sudo add-apt-repository ppa:dajhorn/zfs
sudo apt-get -y update

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}
