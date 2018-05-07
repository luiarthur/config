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
