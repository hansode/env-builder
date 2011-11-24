#!/bin/sh

. ./_common.sh

rpmbuild -ta alien_${alien_version}.tar.gz
