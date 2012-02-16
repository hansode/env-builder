#!/bin/bash

dcmgr_servers="
"
hva_servers="
"

hva_nodes="
 demo1
"


servers="
 ${dcmgr_servers} ${hva_servers}
"


 prefix_path=/home/wakame/wakame-vdc
    abs_path=$(cd $(dirname $0) && pwd)
   local_tmp=${abs_path}/tmp
 fake_prefix=${local_tmp}/wakame-vdc
builder_path=${prefix_path}/test/builder
    tmp_path=${prefix_path}/tmp


ipaddr=$(/sbin/ip route get 8.8.8.8 | head -1 | awk '{print $7}')
account_id=a-shpoolxx

    auth_port=3000;     auth_bind=127.0.0.1
   webui_port=9000;    webui_bind=0.0.0.0
     api_port=9001;      api_bind=127.0.0.1
metadata_port=9002; metadata_bind=${ipaddr}
   proxy_port=8080;    proxy_bind=127.0.0.1
ports="${auth_port} ${webui_port} ${api_port} ${metadata_port}"

# networks table
ipv4_gw="${ipv4_gw:-$(/sbin/ip route get 8.8.8.8 | head -1 | awk '{print $3}')}"
prefix_len="${prefix_len:-$(/sbin/ip route show | awk '$9 == ip { sub(/.*\//, "", $1); print $1; }' ip=$ipaddr)}"

     dns_server=${dns_server:-${ipaddr}}
    dhcp_server=${dhcp_server:-${ipaddr}}
metadata_server=${metadata_server:-${ipaddr}}
     sta_server=${sta_server:-${ipaddr}}

# local store demo machine image
local_store_path="$tmp_path/images"

# virtual machine
vmdir_path=${tmp_path}/instances

#vmimage_uuid=lucid0
#vmimage_file=${vmimage_uuid}.qcow2
#vmimage_s3="http://dlc.wakame.axsh.jp.s3.amazonaws.com/demo/vmimage/${vmimage_file}.gz"

# mysql
dcmgr_dbname=wakame_dcmgr
dcmgr_dbuser=root
webui_dbname=wakame_dcmgr_gui
webui_dbpass=passwd

hypervisor=lxc
#amqp_server_uri=amqp://${ipaddr}:15672/
#amqp_server_uri=amqp://172.31.2.58:15672/
amqp_server_uri=amqp://127.0.0.1:5672/


# work around if this runs under the bundler container.
[[ -n "$BUNDLE_BIN_PATH" ]] && {
  export RUBYOPT="$RUBYOPT -rubygems"
  alias bundle="$BUNDLE_BIN_PATH"
}
# add bin path to $GEM_HOME/bin.
which gem >/dev/null 2>&1 && {
  export PATH="$(ruby -rubygems -e 'puts Gem.bindir'):$PATH"
} || :

alias rake="bundle exec rake"
shopt -s expand_aliases
