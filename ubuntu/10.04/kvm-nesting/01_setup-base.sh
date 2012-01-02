#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e


[ -L /usr/bin/kvm ] && {
  sudo rm -f /usr/bin/kvm
}

find manifest -type f | sed s,^manifest/,, | while read line; do
  echo ... $line; \
  [ -f /$line ] || sudo cp manifest/$line /$line
  diff manifest/$line /$line || sudo cp manifest/$line /$line
done

exit 0
