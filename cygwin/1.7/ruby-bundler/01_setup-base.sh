#!/bin/bash

#. _common.sh

PATH=$PATH:$(gem environment gemhome)/bin
printenv PATH

which bundle || {
  gem install bundler --no-ri --no-rdoc
  gem list
}
