#!/bin/bash

export LANG=C
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

(cd ../nfs-common && make)

pkgs="
"

[ -z "${pkgs}" ] || sudo apt-get install -y ${pkgs}
