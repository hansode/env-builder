#!/bin/bash

#prefix_path=/home/wakame/wakame-vdc
dbnames="
 wakame_dcmgr
 wakame_dcmgr_gui
"
for dbname in ${dbnames}; do
  echo show tables | mysql -uroot ${dbname} >/dev/null 2>&1 && {
    yes | mysqladmin -uroot drop ${dbname} >/dev/null
  }
  mysqladmin -uroot create ${dbname} >/dev/null
done
#echo show databases | mysql -uroot

cat <<EOS | mysql -uroot
grant all on wakame_dcmgr_gui.* to wakame_dcmgr_gui@localhost identified by 'passwd'
EOS

cat <<'EOS' | su - wakame
cd /home/wakame/wakame-vdc/dcmgr
bundle exec rake db:init

cd /home/wakame/wakame-vdc/frontend/dcmgr_gui
bundle exec rake db:init db:sample_data admin:generate_i18n oauth:create_table
EOS

[ -d /home/wakame/wakame-vdc/tmp/instances ] || mkdir -p /home/wakame/wakame-vdc/tmp/instances

[ -d /home/wakame/wakame-vdc/tmp/xpool/a-shpoolxx ] || mkdir -p /home/wakame/wakame-vdc/tmp/xpool/a-shpoolxx
[ -d /home/wakame/wakame-vdc/tmp/snap/a-shpoolxx  ] || mkdir -p /home/wakame/wakame-vdc/tmp/snap/a-shpoolxx

cd /home/wakame/wakame-vdc/tmp/images
#vmimages="
# ubuntu-10.04_without-metadata_lxc_i386.raw.gz
# ubuntu-10.04_with-metadata_lxc_i386.raw.gz
# ubuntu-10.04_with-metadata_lxc_i386.raw.gz
#"
vmimages="
"

for vmimage in ${vmimages}; do
  [ -f ${vmimage} ] || wget http://dlc.wakame.axsh.jp.s3.amazonaws.com/demo/vmimage/${vmimage}
  [ -f ${vmimage%%.gz} ] || zcat ${vmimage} | cp --sparse=always /dev/stdin ${vmimage%%.gz}
  ln -fs /home/wakame/wakame-vdc/tmp/images/${vmimage%%.gz} /home/wakame/wakame-vdc/tmp/snap/a-shpoolxx/${vmimage%%.gz}
done

# hva.conf
perl -pi -e 's,^config.vm_data_dir.*,config.vm_data_dir = "/home/wakame/wakame-vdc/tmp/instances",' /home/wakame/wakame-vdc/dcmgr/config/hva.conf
perl -pi -e 's,^config.edge_networking.*,config.edge_networking = "legacy_netfilter",' /home/wakame/wakame-vdc/dcmgr/config/hva.conf
#perl -pi -e 's,^config.enable_ebtables.*,config.enable_ebtables = false,' /home/wakame/wakame-vdc/dcmgr/config/hva.conf


# metadata drive's mount point
#perl -pi -e 's,rootfs/metadata,rootfs/mnt/metadata,g' /home/wakame/wakame-vdc/dcmgr/lib/dcmgr/drivers/lxc.rb
perl -pi -e 's,3<&-[^"]+,3<&- 4<&- 5<&- 6<&- 7<&- 8<&- 9<&-,' /home/wakame/wakame-vdc/dcmgr/lib/dcmgr/drivers/lxc.rb



cd -
cd ./initializer/
. ./_common.sh
. ${prefix_path}/tests/builder/functions.sh

work_dir=/home/wakame/wakame-vdc
pwd
(. ./91_generate-demo-resource.sh)
