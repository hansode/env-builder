#!/bin/sh

export LANG=C
export LC_ALL=C
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

unset GEM_HOME
unset GEM_PATH
unset RUBYOPT

pkgs="
 SUNWruby18
 SUNWgmake
 SUNWgcc
 SUNWiscsitgt
 SUNWgit
 SUNWscreen
"

for pkg in ${pkgs}; do
  pkg install ${pkg}
done


svcadm enable svc:/system/iscsitgt:default

gem_version=1.3.7
wget http://production.cf.rubygems.org/rubygems/rubygems-update-${gem_version}.gem
gem install rubygems-update-${gem_version}.gem  --no-ri --no-rdoc
[ -f rubygems-update-${gem_version}.gem ] && rm -f rubygems-update-${gem_version}.gem
/var/ruby/1.8/gem_home/bin/update_rubygems

exit 0
