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

# Command line utils to install:
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  conda install -c conda-forge $cmd_line_utils
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

# Since a shell restart is needed ...
source ~/.bashrc
if [[ `which conda` ]]; then
  conda config --set auto_stack 1
  install_cmd_line_utils htop tree tmux ncurses
else
  echo "Conda is still not installed?!"
fi
