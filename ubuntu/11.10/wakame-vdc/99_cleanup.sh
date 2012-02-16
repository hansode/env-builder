#!/bin/bash

LANG=C
LC_ALL=C


initctl stop vdc-collector
initctl stop mysql
/etc/init.d/rabbitmq-server stop

find /var/log/ -type f -name "*.gz" | while read line; do
  rm -f ${line}
done

find /var/log/ -type f -name "*.[0-9]" | while read line; do
  rm -f ${line}
done

find /var/log/ -type f | while read line; do
  echo > ${line}
done

for i in /home/wakame/wakame-vdc/tmp/instances/_base/*; do
  rm -f ${i}
done
