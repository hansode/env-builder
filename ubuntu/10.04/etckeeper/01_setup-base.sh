#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

deb_pkgs="
 etckeeper
"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install ${deb_pkgs}

[ -d /etc/.git ] && sudo rm -rf /etc/.git
sudo etckeeper init

cd /etc
#sudo git rm --cached -r -f ./
#
#sudo git add -f .etckeeper
#sudo git add -f .gitignore
#sudo git add -A
sudo etckeeper commit "Init repo."

exit 0
