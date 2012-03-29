#!/bin/bash

echo "Run as Administrator."

ssh-host-config -y

cygrunsrv -L
cygrunsrv -S sshd
