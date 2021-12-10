#!/bin/bash

mkdir -p ~/lib
mkdir -p ~/tmp
mkdir -p ~/bin

install_conda() {
  echo "Conda not installed. Installing Conda."
  
  # Do things in ~/tmp.
  cd ~/tmp

  # Download installation script.
  echo "Downloading installation script."
  curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh

  # Run installation script.
  echo "Installing Conda."
  bash Miniconda3-latest-MacOSX-x86_64.sh
}

# Install conda if needed.
[[ `which conda` ]] || install_conda

# Install basic libraries if needed.
basic_libs="ncurses htop tree tmux wget"
for lib in $basic_libs
do
  [[ `which $lib` ]] || conda install -c conda-forge $lib
done

# Install neovim
if [[ `which nvim` == "" ]]
then
  curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
  mv nvim-macos.tar.gz ~/tmp
  cd ~/tmp && tar xzf nvim-macos.tar.gz
  mv nvim-osx64 ~/lib
  ln -s ~/lib/nvim-osx64/bin/nvim ~/bin/nvim
  rm ~/tmp/nvim-macos.tar.gz
fi

# Download nvim-config and setup.
if [[ ! -d ~/repo/nvim-config ]]
then
  git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
  cd ~/repo/nvim-config && make install
  cd $current_dir
fi

# Install tmux plugin manager if needed.
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install R.
# conda install -c r

# Install brew
# mkdir -p ~/lib/homebrew && cd ~/lib/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar -xz --strip 1 -C homebrew
# cd

# Install gnu-sed for gush
# brew install gnu-sed

# Install this so that `open` can be used in tmux
# brew install reattach-to-user-namespace
# brew upgrade reattach-to-user-namespace
