#!/bin/bash

mkdir -p ~/bin
mkdir -p ~/lib
mkdir -p ~/tmp

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
    bash ${fname}

    cd -
  }
}

# Install tmux plugin manager.
[[ -d ~/.tmux/plugins/tpm ]] || {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

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

# Install conda if needed.
[[ `which conda` ]] || install_conda

# Install additional packages via conda.
source install-util.sh
