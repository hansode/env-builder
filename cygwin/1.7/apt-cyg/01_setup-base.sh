#!/bin/bash
#
#
set -e

[ -x /usr/bin/apt-cyg ] && exit 0

wget http://apt-cyg.googlecode.com/svn/trunk/apt-cyg
mv apt-cyg /usr/bin
chmod +x /usr/bin/apt-cyg
