#!/bin/bash
# https://jekyllrb.com/docs/installation/
# http://railsapps.github.io/installrubyonrails-ubuntu.html

# if curl not installed:
# sudo apt-get install curl

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
sudo apt-get update
\curl -sSL https://get.rvm.io | bash -s stable --ruby
sudo apt-get install nodejs
gem install jekyll
gem -v
