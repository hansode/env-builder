#!/bin/bash


cat <<EOS > /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
	address 0.0.0.0

auto br0
iface br0 inet dhcp
	bridge_ports eth0
	bridge_stp off
	bridge_maxwait 1
EOS
