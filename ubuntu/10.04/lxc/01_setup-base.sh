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

mount -t cgroup | egrep -q cgroup || {
  [ -d /cgroup ] || sudo mkdir /cgroup
  #echo sudo mount none -t cgroup /cgroup
}

egrep -v ^# /etc/fstab | egrep -q -w cgroup || {
  echo "none /cgroup cgroup defaults 0 0" | sudo tee -a /etc/fstab
}

mount -t cgroup | egrep -q cgroup || sudo mount -a -t cgroup

exit 0
