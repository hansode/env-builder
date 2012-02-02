#!/bin/sh

. ./_common.sh

pkgs="
 git
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y --disablerepo='*' --enablerepo='dag' git
done
