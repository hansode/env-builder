#!/bin/sh

set -e

work_dir=${work_dir:?"work_dir needs to be set"}

export LANG=C
export LC_ALL=C

account_id=${account_id:-"a-shpoolxx"}

hypervisor=${hypervisor:?"hypervisor needs to be set"}

# common
vmimage_dist_name=ubuntu
vmimage_dist_ver=10.04
vmimage_arch=i386
vmimage_desc="${vmimage_dist_name} ${vmimage_dist_ver} ${vmimage_arch}"
# local / with-metadata
vmimage_meta_uuid=lucid5
vmimage_meta_file=${vmimage_dist_name}-${vmimage_dist_ver}_with-metadata_${hypervisor}_${vmimage_arch}.raw
vmimage_meta_path=${local_store_path}/${vmimage_meta_file}

case ${vmimage_arch} in
i386)
  images_arch=x86
  ;;
amd64)
  images_arch=x86_64
  ;;
esac

hva_arch=$(uname -m)
case ${hva_arch} in
x86_64)
  ;;
*)
  hva_arch=x86
  ;;
esac

[ -d ${local_store_path} ] || {
  mkdir -p ${local_store_path}
}

cd ${work_dir}/dcmgr/
#for hva_node in ${hva_nodes}; do
#  shlog ./bin/vdc-manage host add hva.${hva_node} --uuid hn-${hva_node} --force --account-id ${account_id} --cpu-cores 100 --memory-size 400000 --hypervisor ${hypervisor} --arch ${hva_arch}
#  shlog ./bin/vdc-manage host add hva.${hva_node} --uuid hn-${hva_node} --force --account-id ${account_id} --cpu-cores $(egrep ^processor /proc/cpuinfo  | wc -l) --memory-size $(egrep ^MemTotal /proc/meminfo  | awk '{print $2}') --hypervisor ${hypervisor} --arch ${hva_arch}
#  shlog ./bin/vdc-manage host add hva.${hva_node} --uuid hn-${hva_node} --force --account-id ${account_id} --cpu-cores 4 --memory-size $(egrep ^MemTotal /proc/meminfo  | awk '{print $2}') --hypervisor ${hypervisor} --arch ${hva_arch}

#done

for i in {1..1}; do
    shlog ./bin/vdc-manage storage add sta.demo1 \
     --force \
     --uuid sn-demo1 \
     --account-id ${account_id} \
     --base-path ${tmp_path}/xpool \
     --disk-space $((1024 * 1024)) \
     --ipaddr ${sta_server} \
     --storage-type raw \
     --snapshot-base-path ${tmp_path}/snap
done

shlog ./bin/vdc-manage network add \
 --uuid nw-lxcdemo \
 --ipv4-network ${ipv4_gw} \
 --ipv4_gw ${ipv4_gw} \
 --prefix ${prefix_len} \
 --domain vdc.local \
 --dns ${dns_server} \
 --dhcp ${dhcp_server} \
 --metadata ${metadata_server} \
 --metadata-port ${metadata_port} \
 --description lxc-demo \
 --link-interface br0

# bridge only closed network
shlog ./bin/vdc-manage network phy add eth0 --interface eth0

# set forward interface(= physical network) from network
shlog ./bin/vdc-manage network forward nw-lxcdemo eth0

[ -f /etc/redhat-release ] && {
  # rhel
  gw_dev=$(/sbin/ip route get 8.8.8.8 | head -1 | awk '{print $5}')
  ipaddr=$(/sbin/ip addr show ${gw_dev} | grep -w inet | awk '{print $2}')
  [ -z "${range_begin}" ] && range_begin=`ipcalc -n ${ipaddr} | sed 's,.*=,,'`
  [ -z "${range_end}"   ] && range_end=`ipcalc -b ${ipaddr} | sed 's,.*=,,'`
} || {
  # ubuntu
  [ -z "${range_begin}" ] && range_begin=`ipcalc ${ipv4_gw}/${prefix_len} | awk '$1 == "HostMin:" { print $2 }'`
  [ -z "${range_end}"   ] && range_end=`ipcalc ${ipv4_gw}/${prefix_len} | awk '$1 == "HostMax:" { print $2 }'`
}

network=$(echo ${ipaddr} | awk -F'\.' '{printf "%s.%s.%s", $1, $2, $3}')

x4=$(echo ${range_begin} | awk -F\. '{print $4}')
xhalf=$(echo $(($((2 ** $((32 - 25))))/2)))

shlog ./bin/vdc-manage network dhcp addrange nw-lxcdemo ${network}.$((${x4} + ${xhalf})) ${range_end}

#for hva_node in ${hva_nodes}; do
#  shlog ./bin/vdc-manage tag map tag-shhost hn-${hva_node}
#done
# hadoop line
shlog ./bin/vdc-manage tag map tag-shnet nw-lxcdemo

vmimage_md5=$(md5sum ${vmimage_meta_path} | cut -d ' ' -f1)
shlog ./bin/vdc-manage image add local ${vmimage_meta_path} \
 --md5sum ${vmimage_md5} \
 --account-id ${account_id} \
 --uuid wmi-${vmimage_meta_uuid} \
 --arch ${images_arch} \
 --description \"${vmimage_meta_file} local\" \
 --state init

shlog ./bin/vdc-manage spec  add --uuid is-demospec --account-id ${account_id} --arch ${hva_arch} --hypervisor ${hypervisor} --cpu-cores 1 --memory-size 256 --weight 1

shlog ./bin/vdc-manage securitygroup add --uuid  sg-demofgr --account-id ${account_id} --description demo
shlog ./bin/vdc-manage securitygroup modify sg-demofgr --rule=- <<EOF
# demo rule for demo instances
tcp:22,22,ip4:0.0.0.0
tcp:80,80,ip4:0.0.0.0
udp:53,53,ip4:0.0.0.0
icmp:-1,-1,ip4:0.0.0.0
EOF

cat <<'EOS' > /tmp/pub.pem
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZhAOcHSe4aY8GwwLCJ4Et3qUBcyVPokFoCyCrtTZJVUU++B9554ahiVcrQCbfuDlaXV2ZCfIND+5N1UEk5umMoQG1aPBw9Nz9wspMpWiTKGOAm99yR9aZeNbUi8zAfyYnjrpuRUKCH1UPmh6EDaryFNDsxInmaZZ6701PgT++cZ3Vy/r1bmb93YvpV+hfaL/FmY3Cu8n+WJSoJQZ4eCMJ+4Pw/pkxjfuLUw3mFl40RVAlwlTuf1I4bB/m1mjlmirBEU6+CWLGYUNWDKaFBpJcGB6sXoQDS4FvlV92tUAEKIBWG5ma0EXBdJQBi1XxSCU2p7XMX8DhS7Gj/TSu7011 wakame-vdc.pem
EOS

cat <<'EOS' > /tmp/pri.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA2YQDnB0nuGmPBsMCwieBLd6lAXMlT6JBaAsgq7U2SVVFPvgf
eeeGoYlXK0Am37g5Wl1dmQnyDQ/uTdVBJObpjKEBtWjwcPTc/cLKTKVokyhjgJvf
ckfWmXjW1IvMwH8mJ466bkVCgh9VD5oehA2q8hTQ7MSJ5mmWeu9NT4E/vnGd1cv6
9W5m/d2L6VfoX2i/xZmNwrvJ/liUqCUGeHgjCfuD8P6ZMY37i1MN5hZeNEVQJcJU
7n9SOGwf5tZo5ZoqwRFOvglixmFDVgymhQaSXBgerF6EA0uBb5VfdrVABCiAVhuZ
mtBFwXSUAYtV8UglNqe1zF/A4Uuxo/00ru9NdQIDAQABAoIBAC/WHakerFadOGxH
RPsIDxvUZDuOZD1ANNw53kSFBNxZ2XHAxcNcjLpH5xjG8gWvkUVzVRtMGaSPxVvu
s3X3JpPb8PFBk+dzoopYZX83vWjnsAJfxWNvsx1reuuhlzUagXyfohaQOtE9LMrS
nTVzgA3fUBdSHfXDcOm2aS08ApXSJOIxYxD/9AF6HNBsqTe+qvHiHVy570wkc2gf
K8m90NITTefIv67YzyVNubqCa2k9AiDojRKv0MeBpMqzHA3Lyw8El6Z0RTH694aV
AM1+y760DKw3SE320p9wz/onh6mei5jg4eoGDZHqGCY4rb3U9qLkMFHPmsOssWQq
/O5056ECgYEA+y0DHYCq3bcJFxhHqogVYbSnnJTJriC4XObjMK5srz1Y9GL6mfhd
3qJIbyjgRofqLEdOUXq2LR8BVcSnWxVwwzkThtYpRlbHPMv3MPr/PKgyNj3Gsvv5
0Y2EzcLiD1cm1f5Z//EWu+mOAfzW8JOLL8w+ZedsdvCUmFrZp/eClR0CgYEA3bGA
NwWOpERSylkA3cK5XGMFYwj6cE2+EMaFqzdEy4bLKhkdLMEA1NA7CbtO46e7AvCu
sthj5Qty605uGEI6+S5M/IPlX/Gh66f3qnXXNsVKXJbOcUC9lEbRwZa0V1u1Eqrx
mJ3g1as31EgmKRv4vIJ2wQTVgorBNDuUdZUzYjkCgYA3h78Nkbm05Nd8pKCLgiSA
AmmgA4EHHzLDT0RhKd7ba0u0VAGlcrSGGQi8kqPq0/egrG8TMnb+SMGJzb1WNMpG
TuMTR1u+skbAGTPgP02YgnL/bO71+SFFA+2dc/14eMMcQmxxWkK1brA3nkeCzovS
GGyfKOfg79VaTZObP+w9vQKBgQC4dpBLt/kHX75Plh0taHAZml8KF5diyJ1Ekhr4
6wT4IJF91uW6rmFFsnndUBiFPrRR7vg94eXE2HDnsBvVXY56dfcjCZBa89CaJ+ng
0Sqg7SpBvk3KWGcmMIMqBH7MTYduIATky0EgKNZMcTgnbpnaKOgtFRufAlteXdDa
wam+qQKBgHxGg9HJI3Ax8M5rgmsGReBM8e1GHojV5pmgWm0AsX04RS/7/gNkXHdv
MoU4FfcO/Tf7b+qwp40OjN0dr7xDwIWXih2LrAxGK2Lw43hlC5huYmqpEIYoiag+
PxIk/VB7tQxkp4Rtv005mWHPUYlh8x4lMqiVAhPJzEBfN9UEfkrk
-----END RSA PRIVATE KEY-----
EOS

shlog ./bin/vdc-manage keypair add --account-id ${account_id} --uuid ssh-demo --private-key=/tmp/pri.pem --public-key=/tmp/pub.pem

[ -f /tmp/pub.pem ] && rm -f /tmp/pub.pem
[ -f /tmp/pri.pem ] && rm -f /tmp/pri.pem

exit 0
