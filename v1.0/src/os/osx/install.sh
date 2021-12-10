#!/bin/bash

mkdir -p ~/lib
mkdir -p ~/tmp
mkdir -p ~/bin

# Install conda if needed.
[[ `which conda` ]] || {
  echo "Conda not installed. Installing Conda."
  
  # Do things in ~/tmp.
  cd ~/tmp && {
    fname=Miniconda3-latest-MacOSX-x86_64.sh

    # Download installation script.
    echo "Downloading installation script."
    curl -O https://repo.anaconda.com/miniconda/${fname}

    # Run installation script.
    echo "Installing Conda."
    bash ${fname}
    rm ${fname}

    cd -
  }
}
conda config --set auto_stack 1

# Install basic libraries if needed.
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  conda install -c conda-forge $cmd_line_utils
}
install_cmd_line_utils htop tree tmux ncurses wget

# Install neovim
if [[ `which nvim` == "" ]]
then
  curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
  mv nvim-macos.tar.gz ~/tmp
  cd ~/tmp && {
    tar xzf nvim-macos.tar.gz
    mv nvim-osx64 ~/lib
    ln -s ~/lib/nvim-osx64/bin/nvim ~/bin/nvim
    rm ~/tmp/nvim-macos.tar.gz
    cd -
  }
fi

# Download nvim-config and setup.
if [[ ! -d ~/repo/nvim-config ]]
then
  git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
  cd ~/repo/nvim-config && { make install; cd -; }
fi

# Install tmux plugin manager if needed.
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install R.
# conda install -c r

############
### BREW ###
############

# Install brew. SLOW!
# [[ `which brew` ]] || {
#   mkdir -p ~/lib/homebrew 
#   cd ~/lib/homebrew && {
#     curl -L https://github.com/Homebrew/brew/tarball/master | tar -xz --strip 1 -C homebrew
#     cd -
#   }
# }

# Install gnu-sed for gush
# brew install gnu-sed

# Install this so that `open` can be used in tmux
# brew install reattach-to-user-namespace
# brew upgrade reattach-to-user-namespace
