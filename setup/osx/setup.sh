#!/bin/bash

# Dir containing UNIX binaries and configs 
BINDIR="$PWD/../../bin/unix/"
CONFDIR="$PWD/../../conf/unix/"

# Dir containing MAC-specific binaries and configs 
BINOSXDIR="$PWD/../../bin/osx/"
CONFOSXDIR="$PWD/../../conf/osx/"

# Create directories if needed.
mkdir -p ~/bin
mkdir -p ~/lib/R_lib
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/spell
mkdir -p ~/.ssh
mkdir -p ~/.vim/colors
mkdir -p ~/.R
mkdir -p ~/Library/texmf/tex # for custom beamer theme
mkdir -p ~/lib/tex_templates/tex/ # for default latex files
mkdir -p ~/.ssh
mkdir -p ~/templates  # templates from GitHub
mkdir -p ~/lib
mkdir -p ~/.julia/config

# Create the following files>
touch ~/.pythonhistory

# Copy configuration files
cp ${CONFOSXDIR}/profile ~/.profile
cp ${CONFDIR}/tmux.conf ~/.tmux.conf
# cp -r ${CONFDIR}/vim/* ~/.vim/
# cp -f ${CONFOSXDIR}/vimrc ~/.vimrc
cp ${CONFDIR}/git-prompt.sh ~/.git-prompt.sh
cp ${CONFDIR}/gitconfig ~/.gitconfig
cp ${CONFDIR}/gitignore_global ~/.gitignore_global
cp ${CONFDIR}/pythonrc ~/.pythonrc
cp ${CONFDIR}/Rprofile ~/.Rprofile
cp ${CONFDIR}/Renviron ~/.Renviron
cp ${BINDIR}/resources ~/bin/resources
cp ${CONFDIR}/ssh_config ~/.ssh/config
ln -s ${CONFDIR}/bashColors ~/.bashColors
ln -s ${CONFDIR}/asaproc.cls ~/Library/texmf/tex/asaproc.cls
ln -s ${CONFDIR}/beamerthemealui.sty ~/Library/texmf/tex/beamerthemealui.sty
ln -s ${CONFDIR}/redmagick.vim ~/.vim/colors/redmagick.vim

# Copy scripts
ln -s ${BINDIR}/dirsize ~/bin/dirsize
ln -s ${BINDIR}/gush ~/bin/gush
ln -s ${BINDIR}/md ~/bin/md
ln -s ${BINDIR}/sbtgen ~/bin/sbtgen
ln -s ${BINDIR}/sbt-cleanstage ~/bin/sbt-cleanstage
ln -s ${BINDIR}/combineJars ~/bin/combineJars
ln -s ${BINDIR}/mdgen ~/bin/mdgen
ln -s ${BINDIR}/beamergen ~/bin/beamergen
ln -s ${BINDIR}/asamdgen ~/bin/asamdgen
ln -s ${BINDIR}/ignoreall ~/bin/ignoreall
ln -s ${BINDIR}/metrogen ~/bin/metrogen
ln -s ${BINDIR}/captainslog ~/bin/captainslog
ln -s ${BINDIR}/bib2json ~/bin/bib2json
