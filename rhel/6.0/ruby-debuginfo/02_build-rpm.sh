#!/bin/sh

. ./_common.sh

#rpmbuild --rebuild ./ruby-${ruby_version}.el6.src.rpm

#rpm -ivh ./ruby-${ruby_version}.el6.src.rpm
#rpmbuild -ba --define="optflags -pg -g3 -O0" ${rpmbuild_dir}/SPECS/ruby.spec
rpmbuild --rebuild --define="optflags -pg -g3 -O0" ./ruby-${ruby_version}.el6.src.rpm
