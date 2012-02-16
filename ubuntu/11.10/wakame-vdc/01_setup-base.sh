#!/bin/bash

export LANG=C
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive


# disable apparmor
[ -x /etc/init.d/apparmor ] && {
  /etc/init.d/apparmor stop
  /usr/sbin/update-rc.d -f apparmor remove
}

# disable dnsmasq
[ -x /etc/init.d/dnsmasq ] && {
  /etc/init.d/dnsmasq stop
  /usr/sbin/update-rc.d -f dnsmasq remove
}

# disable rabbitmq-server
#[ -x /etc/init.d/rabbitmq-server ] && {
#  /etc/init.d/rabbitmq-server stop
#  /usr/sbin/update-rc.d -f rabbitmq-server remove
#}

# disable nginx
[ -x /etc/init.d/nginx ] && {
  /etc/init.d/nginx stop
  /usr/sbin/update-rc.d -f nginx remove
}

# disable tgt
#[ -x /etc/init.d/tgt ] && {
#  /etc/init.d/tgt stop
#  /usr/sbin/update-rc.d -f tgt remove
#}

#  change timezone
# cp /usr/share/zoneinfo/Japan /etc/localtime

