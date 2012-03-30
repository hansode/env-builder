#!/bin/bash

. _common.sh

[ -x /usr/bin/gem ] || {
  [ -f rubygems-${rubygems_ver}.tgz ] || wget http://production.cf.rubygems.org/rubygems/rubygems-${rubygems_ver}.tgz
  tar zxvf rubygems-${rubygems_ver}.tgz
  cd rubygems-${rubygems_ver}
  ruby ./setup.rb
}
