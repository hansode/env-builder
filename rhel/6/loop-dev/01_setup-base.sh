#!/bin/sh

loop_from=8
loop_to=31

for i in $(seq ${loop_from} ${loop_to}); do
  echo "loop$i"
done > /etc/udev/makedev.d/50-udev.nodes
