#!/bin/bash

blockdiag_cmds="
  blockdiag
  seqdiag
  actdiag
  nwdiag
"

which easy_install && {
  easy_install pillow

  local easy_install_opts=
  for blockdiag_cmd in ${blockdiag_cmds}; do
    easy_install_opts=
    which ${blockdiag_cmd} && easy_install_opts="-U"
    easy_install ${easy_install_opts} ${blockdiag_cmd}
  done
}
