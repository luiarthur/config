#!/bin/bash

# Do updates.
sudo apt update

# Create dirs if needed.
mkdir -p $HOME/lib
mkdir -p $HOME/tmp
mkdir -p $HOME/bin

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
    bash ${fname}

    cd -
  }
}

# Install conda if needed.
[[ `which conda` ]] || install_conda
source ~/.bashrc
conda config --set auto_stack 1  # includes the PATH from outer most conda env.

# Command line utils to install:
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  sudo apt install -y $cmd_line_utils
}
install_cmd_line_utils tmux htop tree

# Install neovim if not installed.
[[ `which neovim` ]] || [[ `which nvim` ]] || {
  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O ~/bin/nvim
  chmod +x ~/bin/nvim
}

# Download nvim-config and setup.
[[ -d ~/repo/nvim-config ]] || {
  git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
  cd ~/repo/nvim-config && { make all; cd -; }
}

# Install tmux plugin manager if needed.
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
