#!/bin/sh

. ./_common.sh

###
[ -f ruby-${ruby_version}.el6.src.rpm ] || {
  #curl -O ftp://ftp.pbone.net/mirror/ftp.redhat.com/pub/redhat/linux/enterprise/6ComputeNode/en/os/SRPMS/ruby-${ruby_version}.el6.src.rpm
  curl -O ftp://ftp.riken.go.jp/pub/Linux/centos/6.0/os/SRPMS/Packages/ruby-${ruby_version}.el6.src.rpm
}
