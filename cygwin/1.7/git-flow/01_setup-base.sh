#!/bin/bash

# . ./_common.sh

which git-flow || {
  [ -f gitflow-installer.sh ] || wget --no-check-certificate https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh
  bash ./gitflow-installer.sh
}
