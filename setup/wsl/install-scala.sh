#!/bin/bash

function install_scala() {
  # Install java 8
  sudo apt install -y openjdk-8-jdk

  # Install scala
  sudo apt install -y scala

  # install SBT
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
  sudo apt update
  sudo apt install -y sbt

  # See notes in `../osx/install.sh` for what to do if behind firewall.
}

install_scala
