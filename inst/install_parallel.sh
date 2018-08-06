#!/bin/bash

# See the great excuses to not install GNU parallel
# http://oletange.blogspot.com/2013/04/why-not-install-gnu-parallel.html

# This is where the package will be downloaded to
tmp_dir="$HOME/tmp_install_parallel_here_blablablablabla_ihopeineverusethisdir/"
mkdir -p $tmp_dir
cd $tmp_dir

# Installs parallel to ~/bin
(wget pi.dk/3 -qO - ||  curl pi.dk/3/) | bash

# remove the installation files
cd $HOME
rm -rf $tmp_dir

