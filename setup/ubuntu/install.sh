#!/bin/bash

sudo apt update

# Install tlp for battery enhancement
sudo apt install -y tlp tlp-rdw
sudo tlp start

# Gnome-tweaks (for system settings)
sudo apt install -y gnome-tweaks

# Install pip
sudo apt install -y python-pip

# Install Google Calendar Command-line Client
pip install gcalcli
# test with `gcalcli agenda`

# Pandoc
sudo apt install -y pandoc

# Latex
### Install Basic Latex ###
sudo apt install -y texlive-latex-extra
### Install special fonts (e.g. bbm.sty) ### 
sudo apt install -y texlive-fonts-extra

# R 
sudo apt install -y r-base-core

# Java
sudo apt install -y default-jre
sudo apt install -y default-jdk

# Scala
sudo apt install -y scala

# SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt update
sudo apt install -y sbt
# See notes in `../osx/install.sh` for what to do if behind firewall.

# For recompiling C / C++ (especially Rcpp)
sudo apt install -y ccache


