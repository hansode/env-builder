#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

mount -t cgroup | egrep -q cgroup || {
  [ -d /cgroup ] || sudo mkdir /cgroup
  #echo sudo mount none -t cgroup /cgroup
}

egrep -v ^# /etc/fstab | egrep -q -w cgroup || {
  echo "none /cgroup cgroup defaults 0 0" | sudo tee -a /etc/fstab
}

mount -t cgroup | egrep -q cgroup || sudo mount -a -t cgroup

exit 0
