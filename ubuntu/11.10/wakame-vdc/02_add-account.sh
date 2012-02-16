#!/bin/bash


export LANG=C
export LC_ALL=C


# wakame account
getent group  wakame >/dev/null || {
  groupadd wakame
}

getent passwd wakame >/dev/null || {
  useradd -d /home/wakame -s /bin/bash -g wakame -m wakame
}

egrep -q ^wakame /etc/sudoers || {
  echo "wakame  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
}
