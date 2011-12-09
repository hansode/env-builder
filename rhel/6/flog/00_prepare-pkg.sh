#!/bin/sh

set -e

rpm -ql alien >/dev/null || (cd ../alien/ && make)
(cd ../fakeroot/ && make)
(cd ../alien/ && make)
