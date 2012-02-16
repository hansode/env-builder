#!/bin/bash

egrep '^net.ipv4.ip_forward=1' -q /etc/sysctl.conf || {
  echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
}

sysctl -p

jobs="
 vdc-api.conf
 vdc-collector.conf
 vdc-hva.conf
 vdc-metadata.conf
 vdc-nsa.conf
 vdc-sta.conf
 vdc-webui.conf
"

for job in ${jobs}; do
  [ -f /etc/init/${job} ] || curl https://raw.github.com/axsh/wakame-vdc/master/contrib/etc/init/${job} -o /etc/init/${job}
done
