#!/bin/bash

# Do updates.
sudo apt update

# Create dirs if needed.
mkdir -p $HOME/lib
mkdir -p $HOME/tmp
mkdir -p $HOME/bin

install_conda() {
  echo "Conda not installed. Installing Conda."
  
  # Do things in ~/tmp.
  cd ~/tmp && {
    # Script name.
    fname=Miniconda3-latest-Linux-x86_64.sh

    # Download installation script.
    echo "Downloading installation script."
    wget https://repo.anaconda.com/miniconda/${fname}

    # Run installation script.
    echo "Installing Conda."
    bash ${fname}

    # Remove install script.
    rm ~/tmp/${fname}

    cd -
  }
}

# Install conda if needed.
[[ `which conda` ]] || install_conda
conda config --set auto_stack 1

# Command line utils to install:
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  echo "sudo apt install -y $cmd_line_utils"
}
install_cmd_line_utils tmux htop tree

# Install neovim
[[ `which nvim` ]] || {
  cd ~/tmp && { 
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage ~/bin/nvim
    cd -
  }
}

# Download nvim-config and setup.
[[ -d ~/repo/nvim-config ]] || {
  git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
  cd ~/repo/nvim-config && { make install; cd -; }
}

# Install tmux plugin manager if needed.
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
