#!/bin/sh

pkgs="
"

for pkg in ${pkgs}; do
  pfexec pkg install ${pkg}
done

(cd ../ruby/ && make)

gem_version=1.3.7
wget http://production.cf.rubygems.org/rubygems/rubygems-update-${gem_version}.gem
pfexec gem install rubygems-update-${gem_version}.gem  --no-ri --no-rdoc
[ -f rubygems-update-${gem_version}.gem ] && rm -f rubygems-update-${gem_version}.gem
pfexec /var/ruby/1.8/gem_home/bin/update_rubygems

which gem
gem -v

exit 0
