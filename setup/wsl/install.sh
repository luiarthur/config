#!/bin/bash

# Update repositories
sudo apt update && sudo apt upgrade

# Install tmux related plugins. tmux ships with wsl.
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# test -f ~/.tmux.conf && tmux source ~/.tmux.conf

# Install better vim
# sudo apt install -y vim-gnome
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install pip
# sudo apt install -y python3-pip

# Install Latex
source install-latex.sh

# Install R
sudo apt install -y r-base-core

# For recompiling C / C++ (especially Rcpp)
sudo apt install -y ccache

# Install scala
# source install-scala.sh

# TODO: Install julia from julia website
