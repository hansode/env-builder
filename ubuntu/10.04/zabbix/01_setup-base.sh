#!/bin/bash
#
# Ubuntu 10.04 LTS
#
. ./_config

#sudo \
# DEBIAN_FRONTEND=noninteractive \
# apt-get \
# -q -y \
# install ${deb_pkgs}

dbhost=localhost
dbuser=zabbix
dbpass=zabbix

install_deb_pkg() {
  deb_pkg=$*
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkg}
}

backup_config() {
  file=$1
  [ -f ${file}.0 ] || {
    sudo cp -pi ${file} ${file}.0
  }
}


#
# install
#
install_deb_pkg zabbix-server-mysql
cat <<ZABBIX_PRESEED | egrep -v ^# | sudo debconf-set-selections
zabbix-server-mysql zabbix-server-mysql/database-type select mysql
zabbix-server-mysql zabbix-server-mysql/dbconfig-install boolean true
zabbix-server-mysql zabbix-server-mysql/mysql/app-pass password ${dbpass}
zabbix-server-mysql zabbix-server-mysql/password-confirm password ${dbpass}
zabbix-server-mysql zabbix-server-mysql/app-password-confirm password ${dbpass}
zabbix-server-mysql zabbix-server-mysql/dbconfig-remove boolean true
ZABBIX_PRESEED

cat <<EOS | mysql -uroot mysql
set password for ${dbuser}@${dbhost} = password('${dbpass}');
EOS

# always returns error exit code. dbconfig's issue. latest version will be solved.
install_deb_pkg zabbix-frontend-php || :
cat <<ZABBIX_PRESEED | egrep -v ^# | sudo debconf-set-selections
zabbix-frontend-php zabbix-frontend-php/database-type select mysql
zabbix-frontend-php zabbix-frontend-php/mysql/app-pass password ${dbpass}
zabbix-frontend-php zabbix-frontend-php/password-confirm password ${dbpass}
zabbix-frontend-php zabbix-frontend-php/app-password-confirm password ${dbpass}
zabbix-frontend-php zabbix-frontend-php/mysql/admin-user string root
ZABBIX_PRESEED
install_deb_pkg zabbix-frontend-php

#echo ">>> generated /etc/zabbix/dbconfig.php."
#sudo cat /etc/zabbix/dbconfig.php



#
# configure
#
phpini_config=/etc/php5/apache2/php.ini
replace_rules="
 s,^;date.timezone =,date.timezone =,;
  s,^date.timezone =.*,date.timezone = Asia/Tokyo,;
  s,^post_max_size =.*,post_max_size = 32M,;
  s,^max_execution_time =.*,max_execution_time = 300,;
 s,^;mbstring.func_overload =,mbstring.func_overload =,;
  s,^mbstring.func_overload =.*,mbstring.func_overload = 2,;
"

backup_config ${phpini_config}
sudo perl -pi -e "${replace_rules}" ${phpini_config}
sudo /etc/init.d/apache2 reload


zabbix_server_config=/etc/zabbix/zabbix_server.conf
replace_rules="
 s,#FpingLocation=.*,FpingLocation=,;
 s,FpingLocation=.*,FpingLocation=/usr/bin/fping,;

 s,#DBPassword=.*,DBPassword=,;
 s,DBPassword=.*,DBPassword=zabbix,;
"
backup_config ${zabbix_server_config}
sudo perl -pi -e "${replace_rules}" ${zabbix_server_config}
sudo /etc/init.d/zabbix-server restart


install_deb_pkg zabbix-agent

exit 0
