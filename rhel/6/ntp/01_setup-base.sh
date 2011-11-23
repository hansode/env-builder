#!/bin/sh

chkconfig --list ntpd
sudo chkconfig ntpd on
chkconfig --list ntpd
