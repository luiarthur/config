#!/bin/bash

# Function to install Fira Sans font for metropolis theme
function install_fira_sans_fonts() {
  mkdir tmp-fira-sans
  cd tmp-fira-sans
  wget https://github.com/luiarthur/FiraSans/archive/master.zip
  unzip master.zip
  local PATH_TO_FONTS="$HOME/.fonts"
  mkdir -p $PATH_TO_FONTS/opentype/fira
  mkdir -p $PATH_TO_FONTS/truetype/fira
  find FiraSans-master/ -name "*.otf" -exec cp {} $PATH_TO_FONTS/opentype/fira/ \;
  find FiraSans-master/ -name "*.ttf" -exec cp {} $PATH_TO_FONTS/truetype/fira/ \;
  cd ../ && rm -rf tmp-fira-sans
}

# Function to install latex and desired fonts
function install_latex_stuff() {
  # Install Latex science
  sudo apt install -y texlive-science
  # Install fira fonts
  install_fira_sans_fonts
}

install_latex_stuff
