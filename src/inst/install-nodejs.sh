#!/bin/bash

# NOTE This script is taken from:
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04#removing-nodejs

# NOTE: This script installs latest nodejs and npm using nvm. Installation time
# is relatively short because pre-built binaries are installed.

# NOTE: Use `nvm ls-remote` to find "Latest LTS" version of nodejs.
# Change the following accordingly
# nvm ls-remote

# Latest nodejs version
# TODO: Change this accordingly, after inspecting output of
#       `nvm ls-remote`
latest_nodejs_version=12.16.3  

# Install latest nodejs version
nvm install $latest_nodejs_version

# Usually, nvm will switch to use the most recently installed version. You can
# tell nvm to use the version you just downloaded by typing:
nvm use $latest_nodejs_version

# See latest node version
echo "node version: " `node -v`

# See latest npm version
echo "npm version" `npm -v`
