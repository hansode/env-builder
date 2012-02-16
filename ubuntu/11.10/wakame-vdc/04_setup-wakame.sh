#!/bin/bash


cat <<'EOS' | su - wakame
cd /home/wakame
[ -f /home/wakame/wakame-vdc-v11.12.tar.gz ] || {
  wget https://github.com/axsh/wakame-vdc/tarball/v11.12.0 \
   -O /home/wakame/wakame-vdc-v11.12.tar.gz
}

[ -d wakame-vdc ] || {
  extracted_dir=$(tar ztvpf /home/wakame/wakame-vdc-v11.12.tar.gz | head -1 | awk '{print $6}')
  [ -d ${extracted_dir} ] || {
    tar zxvpf wakame-vdc-v11.12.tar.gz
    mv ${extracted_dir} wakame-vdc
  }
}

#[ -f /home/wakame/wakame-vdc-v11.12.tar.gz ] && {
#  rm -f /home/wakame/wakame-vdc-v11.12.tar.gz
#}

cd /home/wakame/wakame-vdc/dcmgr/config
for i in *.example; do cp -f ${i} ${i%%.example}; done

cd /home/wakame/wakame-vdc/frontend/dcmgr_gui/config/
for i in *.example; do cp -f ${i} ${i%%.example}; done

target_dirs="
 /home/wakame/wakame-vdc/dcmgr/
 /home/wakame/wakame-vdc/frontend/dcmgr_gui/
"
for target_dir in ${target_dirs}; do
  cd ${target_dir}
  bundle install --path=.vendor/bundle
done

unicorn_confs="
  /home/wakame/wakame-vdc/dcmgr/config/unicorn-api.conf
  /home/wakame/wakame-vdc/dcmgr/config/unicorn-metadata.conf
  /home/wakame/wakame-vdc/frontend/dcmgr_gui/config/unicorn-webui.conf
"

for i in ${unicorn_confs}; do
cat << EOD > ${i}
worker_processes 4 # this should be >= nr_cups
timeout 30

after_fork do |server, worker|
  ::Kernel.srand
end
EOD
done

EOS
