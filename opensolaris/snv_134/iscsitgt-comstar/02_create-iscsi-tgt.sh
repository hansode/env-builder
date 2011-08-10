#!/bin/sh -e

zpool_name=xpool
zvol_name=comstar-0
zvol_size=1g
zvol_path=${zpool_name}/${zvol_name}
zvol_rdsk_path=/dev/zvol/rdsk/${zvol_path}
iqn=iqn.2005-04.hansode.org:unit-test-0


shlog() {
  echo "test\$ $*"
  eval $*
  echo "=> exitstatus:$?"
}



cat <<EOS
#
# create zvol"
#
EOS
zfs list ${zvol_path} || {
  shlog pfexec zfs create -s -V ${zvol_size} ${zvol_path}
}
echo


cat <<EOS
#
# create lu"
#
EOS
pfexec sbdadm list-lu | grep ${zvol_rdsk_path} || {
  shlog pfexec sbdadm create-lu ${zvol_rdsk_path}
}
guid=$(pfexec sbdadm list-lu | grep ${zvol_rdsk_path} | awk '{print $1}')
shlog pfexec stmfadm list-lu -v ${guid}
echo


cat <<EOS
#
# add view
#
EOS
pfexec stmfadm list-view -l ${guid} || {
  shlog pfexec stmfadm add-view ${guid}
}
shlog pfexec stmfadm list-view -l ${guid}
echo


cat <<EOS
#
# create target
#
EOS
shlog pfexec itadm list-target -v
echo
shlog pfexec itadm create-target -n ${iqn}
shlog pfexec itadm list-target -v ${iqn}
echo


cat <<EOS
#
# setup iscsi initiator
#
EOS
shlog pfexec iscsiadm list initiator-node
echo
shlog pfexec iscsiadm add discovery-address 127.0.0.1
echo
shlog pfexec iscsiadm modify discovery -t enable
echo


cat <<EOS
#
# show iSCSI device
#
EOS
shlog iostat -En
echo


cat <<EOS
#
# delete target
#
EOS
shlog pfexec stmfadm offline-target ${iqn}
shlog pfexec itadm delete-target ${iqn}
echo


cat <<EOS
#
# delete lu
#
EOS
shlog pfexec stmfadm delete-lu ${guid}


echo
