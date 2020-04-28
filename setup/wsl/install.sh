#!/bin/bash

# Update repositories
echo "Preparing for installs"
sudo apt update && sudo apt upgrade

# Install tmux related plugins. tmux ships with wsl.
echo "tmux installations ..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
test -f ~/.tmux.conf && tmux source ~/.tmux.conf

# Install better vim
echo "Vim installations ..."
sudo apt install -y vim-gnome
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

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

# Install scala
# echo "scala installations ..."
# source install-scala.sh

# TODO: Install julia from julia website
