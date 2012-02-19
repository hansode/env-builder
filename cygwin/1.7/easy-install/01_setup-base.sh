#!/bin/bash

[ -x /usr/bin/easy_install ] || {
  [ -x ./ez_setup.py ] || {
    wget http://peak.telecommunity.com/dist/ez_setup.py
  }
  chmod +x ./ez_setup.py
  ./ez_setup.py
}
