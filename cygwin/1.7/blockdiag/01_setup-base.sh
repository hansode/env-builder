#!/bin/bash

blockdiag_cmds="
  blockdiag
  seqdiag
  actdiag
  nwdiag
"

which easy_install && {
  easy_install pillow

  for blockdiag_cmd in ${blockdiag_cmds}; do
    easy_install ${blockdiag_cmd}
  done
}
