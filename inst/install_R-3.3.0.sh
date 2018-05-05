#!/bin/bash

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo add-apt-repository -y "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -s -c)/"
sudo apt-get update -y
sudo apt-get install -y r-base r-base-dev
