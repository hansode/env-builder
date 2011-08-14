#!/bin/sh -e


# extract opts
for arg in $*; do
  case $arg in
    --*=*)
      key=${arg%%=*}; key=${key##--}
      value=${arg##--*=}
      eval ${key}=${value}
      ;;
  esac
done

zpool_name=${zpool_name:-xpool}
zvol_name=${zvol_name:-comstar-0}
zvol_size=${zvol_size:-1g}
zvol_path=${zpool_name}/${zvol_name}
zvol_rdsk_path=/dev/zvol/rdsk/${zvol_path}
iqn=${iqn:-iqn.2005-04.org.hansode:${zvol_name}.unit-test-0}


#
# local functions
#
shlog() {
  echo "test\$ $*"
  eval $*
  ret=$?
  echo "=> exitstatus:${ret}"
  return ${ret}
}

get_guid() {
  pfexec sbdadm list-lu | grep ${zvol_rdsk_path} | awk '{print $1}'
}

create_zvol() {
  cat <<EOS
#
# create zvol
#
EOS
  zfs list ${zvol_path} >/dev/null 2>&1 || {
    shlog pfexec zfs create -s -V ${zvol_size} ${zvol_path}
  }
  echo
}

create_lu() {
  cat <<EOS
#
# create lu
#
EOS
  pfexec sbdadm list-lu | grep ${zvol_rdsk_path} || {
    shlog pfexec sbdadm create-lu ${zvol_rdsk_path}
  }
  guid=$(get_guid)
  shlog pfexec stmfadm list-lu -v ${guid}
  echo
}


add_view() {
  cat <<EOS
#
# add view
#
EOS
  guid=$(get_guid)
  pfexec stmfadm list-view -l ${guid} || {
    shlog pfexec stmfadm add-view ${guid}
  }
  shlog pfexec stmfadm list-view -l ${guid}
  echo
}


create_iscsi_target() {
  cat <<EOS
#
# create target
#
EOS
  shlog pfexec itadm list-target -v
  echo
  shlog pfexec itadm create-target -n ${iqn}
  shlog pfexec stmfadm offline-target ${iqn}
  shlog pfexec stmfadm online-target  ${iqn}
  shlog pfexec itadm list-target -v   ${iqn}
  echo
}

setup_iscsi_initiator() {
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
}


show_iscsi_device() {
  cat <<EOS
#
# show iSCSI device
#
EOS
  shlog iostat -En
  echo
}

delete_iscsi_target() {
  cat <<EOS
#
# delete target
#
EOS
  shlog pfexec stmfadm offline-target ${iqn}
  shlog pfexec itadm delete-target ${iqn}
  echo
}

remove_view() {
  cat <<EOS
#
# remove view
#
EOS
  guid=$(get_guid)
  pfexec stmfadm list-view -l ${guid} >/dev/null && {
      shlog pfexec stmfadm remove-view -l ${guid}
  }
}

delete_lu() {
  cat <<EOS
#
# delete lu
#
EOS
  guid=$(get_guid)
  shlog pfexec stmfadm delete-lu ${guid}
  echo
}

destroy_zvol() {
  cat <<EOS
#
# destroy_zvol
#
EOS
  shlog pfexec zfs destroy ${zvol_path}
  echo
}



#
# main
#
case $1 in
create)
  create_zvol
  create_lu
  add_view
  create_iscsi_target
  setup_iscsi_initiator
  ;;
show|status)
  guid=$(get_guid)
  [ -z "${guid}" ] || {
    shlog pfexec stmfadm list-lu -v ${guid}
    shlog pfexec stmfadm list-view -l ${guid}
  }
  shlog pfexec itadm list-target -v ${iqn}
  shlog pfexec iscsiadm list target
  show_iscsi_device
  ;;
delete)
  delete_iscsi_target
  delete_lu
  destroy_zvol
  ;;
*)
  # create phase
  create_zvol
  create_lu
  add_view
  create_iscsi_target

  # show phase
  setup_iscsi_initiator
  show_iscsi_device

  # delete phase
  delete_iscsi_target
  delete_lu
  destroy_zvol
  ;;
esac
