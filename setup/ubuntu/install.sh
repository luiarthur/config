#!/bin/bash

# For recompiling C / C++ (especially Rcpp)
sudo apt get install ccache

# Install pip
sudo apt get update
sudo apt install python-pip

# Install Google Calendar Command-line Client
pip install gcalcli

# Latex
### Install Basic Latex ###
sudo apt install texlive-latex-extra
### Install special fonts (e.g. bbm.sty) ### 
sudo apt install texlive-fonts-extra

# R 
sudo apt install r-base-core

# Java
sudo apt install default-jre
sudo apt install default-jdk

# SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt update
sudo apt install sbt
