#!/bin/bash

# Update repositories
echo "Preparing for installs"
sudo apt update && sudo apt upgrade

# Install pip
echo "pip installations ..."
sudo apt install -y python3-pip

# Install Latex
echo "latex installations ..."
source install-latex.sh

# Install R
echo "R installations ..."
sudo apt install -y r-base-core

# For recompiling C / C++ (especially Rcpp)
echo "ccache installations ..."
sudo apt install -y ccache

# Install nodejs
echo "nodejs installations ..."
source install-nvm.sh
source install-nodejs.sh  # TODO: change latest_version in this script 

# NOTE: Needs to be run line-by-line
# Install jupyter
# echo "jupyter installations ..."
# source install-jupyter.sh

# Install scala
# echo "scala installations ..."
# source install-scala.sh

# TODO: Install julia from julia website
