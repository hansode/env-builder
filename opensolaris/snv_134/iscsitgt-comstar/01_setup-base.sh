#!/bin/sh -e


pkgs="
 storage-server
 network/iscsi/target
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

pfexec svcadm disable iscsitgt
pfexec svcadm enable svc:/network/iscsi/target:default
pfexec svcadm enable stmf
echo

echo "# after"
svcs  | grep iscsi
svcs stmf
echo

pfexec stmfadm list-state
