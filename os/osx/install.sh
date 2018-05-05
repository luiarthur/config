#!/bin/bash

brew install sbt
brew install scala
brew install python # Installs python / pip / Setuptools (default osx python doesn't have pip)
brew install wget # 15 minutes. Consider just doing `curl -O someurl.com`
brew install pandoc # SLOW!...

# Install R
brew tap homebrew/science
brew install r # SLOW


# Install MaxTex
# http://tex.stackexchange.com/questions/106113/is-there-any-way-to-have-a-latex-compiler-on-a-mac-without-root-access
#brew install caskroom/cask/brew-cask
#brew cask install MacTex
#brew cask install texmaker

# At LLNL, behind firewall, need to add repo manually.
# See https://stackoverflow.com/questions/18505176/unresolved-dependency-sbt-0-13-0-after-update
# In file ~/.sbt/repositories, put this:
#[repositories]
#  local
#  sbt-releases-repo: http://repo.typesafe.com/typesafe/ivy-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
#  sbt-plugins-repo: http://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
#  maven-central: http://repo1.maven.org/maven2/
