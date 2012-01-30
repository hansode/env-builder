#!/bin/sh

. ./_common.sh

#rpmbuild --rebuild ./ruby-${ruby_version}.el6.src.rpm

rpm -ivh ./ruby-${ruby_version}.el6.src.rpm
rpmbuild -ba ${rpmbuild_dir}/SPECS/ruby.spec
