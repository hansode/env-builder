#!/bin/bash

echo "Run as Administrator."

/usr/bin/init-config -y

cygrunsrv -S init
cygrunsrv -L
