#!/bin/bash

# NOTE: This script install NVM (node version manager).
# This is preferred over install a system-wide nodejs.

curl -sL \
  https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh \
  -o install_nvm_tmp.sh

bash install_nvm_tmp.sh

rm -f install_nvm_tmp.sh
