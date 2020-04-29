#!/bin/bash

# NOTE: This script installs latest nodejs and npm. Installation time is
# relatively short because pre-built binaries are installed.

# NOTE: May need change this link to get latest nodejs / npm
curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -

# This installs nodejs and npm.
sudo apt-get install -y nodejs

# Check if version is latest
node -v
