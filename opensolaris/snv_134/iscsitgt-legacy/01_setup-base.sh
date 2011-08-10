#!/bin/sh -e


pkgs="
 network/iscsi/target/legacy
"

for pkg in ${pkgs}; do
  pkg info ${pkg} || pfexec pkg install ${pkg}
  pkg contents ${pkg}
done
echo

pkg list | grep iscsi
echo

echo "# before"
svcs  | grep iscsi
echo

pfexec svcadm enable iscsitgt
pfexec svcadm disable svc:/network/iscsi/target:default
svcs | grep -w stmf && pfexec svcadm disable stmf
echo

echo "# after"
svcs  | grep iscsi
echo
