#!/bin/bash

export LANG=C
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

pkgs="
 git

 ebtables iptables ipset ethtool vlan
 openssh-server openssh-client
 ruby ruby-dev libruby1.8
 g++
 curl libcurl4-openssl-dev
 mysql-server mysql-client libmysqlclient16-dev
 lxc
 dnsmasq
 open-iscsi open-iscsi-utils
 nginx
 libxml2-dev  libxslt1-dev
 ipcalc
 dosfstools

 rubygems ruby-bundler
 tgt
 screen man
 bridge-utils
 rabbitmq-server
 flog
"

apt-get install -y ${pkgs}
