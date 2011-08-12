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

pfexec svcadm disable svc:/system/iscsitgt:default
pfexec svcadm enable  svc:/network/iscsi/target:default
pfexec svcadm enable  svc:/system/stmf:default
echo

echo "# after"
svcs  | grep iscsi
svcs stmf
echo

pfexec stmfadm list-state
