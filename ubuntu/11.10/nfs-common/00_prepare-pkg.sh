#!/bin/bash

export LANG=C
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

pkgs="
 nfs-common
"

[ -z "${pkgs}" ] || sudo apt-get install -y ${pkgs}
