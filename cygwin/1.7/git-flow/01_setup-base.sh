#!/bin/bash

# . ./_common.sh

which git-flow || {
  wget -q -O - --no-check-certificate https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | bash
}
