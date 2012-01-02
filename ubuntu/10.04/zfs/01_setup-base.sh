#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

sudo add-apt-repository ppa:dajhorn/zfs
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install linux-headers-`uname -r`

#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zfs-lib spl dkms
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install spl-dkms
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zfs
sudo modprobe zfs
