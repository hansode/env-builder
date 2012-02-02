#!/bin/sh

. ./_common.sh

[ -d ./manifest/ ] && sudo rsync -avx ./manifest/ /
