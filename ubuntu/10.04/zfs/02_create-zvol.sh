#!/bin/sh -e

vol_size=64
raw_dir=/var/tmp/zfs
raw_file=${raw_dir}/${vol_size}mb-0.raw
zpool_name=xpool
zvol_size=1g
zvol_name=${zvol_size}-sparse
zvol_path=${zpool_name}/${zvol_name}

sudo zfs list
echo

[ -d ${raw_dir} ] || {
  mkdir ${raw_dir}
}

[ -f ${raw_file} ] || {
  dd if=/dev/zero of=${raw_file} bs=1M count=${vol_size}
}

# create  zpool
sudo zpool status ${zpool_name} >/dev/null 2>&1 || {
  sudo zpool create ${zpool_name} ${raw_file}
}
sudo zpool status ${zpool_name}
sudo zfs list ${zpool_name}
echo

# create zvol
sudo zfs list ${zvol_path} >/dev/null 2>&1 || {
  sudo zfs create -s -V ${zvol_size} ${zvol_path}
}
sudo zfs list ${zvol_path}
echo
ls -la /dev/zvol/
echo

sudo zfs list -t volume
sudo zfs destroy ${zvol_path}
echo

sudo zpool status ${zpool_name}
sudo zfs list ${zpool_name}

sudo zpool destroy ${zpool_name}
echo

sudo zfs list
echo
