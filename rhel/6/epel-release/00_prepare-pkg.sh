#!/bin/bash
#
# rhel6
#

set -e

rpm -ql epel-release >/dev/null || rpm -ivh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-6.noarch.rpm

exit 0
