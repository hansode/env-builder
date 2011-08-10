#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 python-software-properties/natty
 dkms
 spl
 zlib1g-dev uuid-dev libblkid-dev libselinux-dev parted lsscsi
"

(cd ../ubuntu-natty/ && make)
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

sudo add-apt-repository ppa:dajhorn/zfs
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install linux-headers-`uname -r`

#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zfs-lib spl dkms
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install spl-dkms
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zfs
