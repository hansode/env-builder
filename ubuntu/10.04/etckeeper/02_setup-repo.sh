#!/bin/bash
#
# Ubuntu 10.04 LTS
#

set -e

[ -d /etc/.git ] && sudo rm -rf /etc/.git

cd /etc
sudo etckeeper init
sudo etckeeper commit "Init repo."

exit 0
