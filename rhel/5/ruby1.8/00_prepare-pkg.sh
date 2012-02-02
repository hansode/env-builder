#!/bin/sh

set -e

pkgs="
"

for pkg in ${pkgs}; do
  rpm -ql ${pkg} >/dev/null || sudo yum install -y ${pkg}
done

(cd ../checkinstall/ && make)
