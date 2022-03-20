#!/bin/bash

# Do updates.
sudo apt update

# Create dirs if needed.
mkdir -p $HOME/lib
mkdir -p $HOME/tmp
mkdir -p $HOME/bin

# Make sure install dir exists.
CONDA_HOME=$HOME/lib/miniconda3
mkdir -p $HOME/lib
 
# Install conda if not installed.
install_conda() {
  echo "Conda not installed. Installing Conda."
 
  # Do things in /tmp.
  cd /tmp && {
    # Script name.
    fname=Miniconda3-latest-Linux-x86_64.sh

    # Download installation script.
    echo "Downloading installation script."
    wget https://repo.anaconda.com/miniconda/${fname}

    # Run installation script.
    echo "Installing Conda."
    bash ${fname} -b -p ${CONDA_HOME}

    cd -
  }
}

# Command line utils to install:
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  sudo apt install -y $cmd_line_utils
}
install_cmd_line_utils tmux htop tree neovim

# Download nvim-config and setup.
[[ -d ~/repo/nvim-config ]] || {
  git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
  cd ~/repo/nvim-config && { make all; cd -; }
}

# Install tmux plugin manager if needed.
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install conda if needed.
[[ `which conda` ]] || install_conda


