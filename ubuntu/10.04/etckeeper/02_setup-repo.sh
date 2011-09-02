#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

[ -d /etc/.git ] && sudo rm -rf /etc/.git

cd /etc
sudo etckeeper init

#sudo git rm --cached -r -f ./
#
#sudo git add -f .etckeeper
#sudo git add -f .gitignore
#sudo git add -A
sudo etckeeper commit "Init repo."

exit 0
