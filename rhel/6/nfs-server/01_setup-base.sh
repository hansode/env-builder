#!/bin/bash
#
# rhel6
#

set -e

(cd ../nfs-common/ && make)

service nfs status || service nfs start

echo should edit /etc/exports
exportfs -ra
exportfs -v

exit 0
