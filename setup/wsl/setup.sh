#!/bin/bash

export CONFDIR="$PWD/../../conf/unix/"
export WSLCONFDIR="$PWD/../../conf/wsl/"
export BINDIR="$PWD/../../bin/unix/"

# NOTE: Fixes default permissions of new directories in WSL.
# Source: https://www.turek.dev/post/fix-wsl-file-permissions/
if [[ "$(umask)" = "0000" ]]; then
  umask 0022
fi

# Make the following directories if they do not yet exist
mkdir -p ~/bin/
mkdir -p ~/lib/R_lib/
mkdir -p ~/.vim/colors/
mkdir -p ~/.texmf/tex/ # for custom beamer theme
mkdir -p ~/lib/tex_templates/tex/ # for default latex files
mkdir -p ~/.R/
mkdir -p ~/.ssh/
mkdir -p ~/.julia/config/
mkdir -p ~/programs

# Copy these configuration files to the right place
cp ${WSLCONFDIR}/bashrc ~/.bashrc
cp ${CONFDIR}/git-prompt.sh ~/.git-prompt.sh
cp ${CONFDIR}/gitconfig ~/.gitconfig
cp ${CONFDIR}/gitignore_global ~/.gitignore_global
cp ${CONFDIR}/pythonrc ~/.pythonrc
ln -s ${CONFDIR}/redmagick.vim  ~/.vim/colors
cp ${CONFDIR}/R-Makevars ~/.R/Makevars
cp ${CONFDIR}/Renviron ~/.Renviron
cp ${CONFDIR}/Rprofile ~/.Rprofile
cp ${CONFDIR}/ssh_config ~/.ssh/config
cp ${WSLCONFDIR}/tmux.conf ~/.tmux.conf
cp -r ${CONFDIR}/vim/* ~/.vim/
cp ${CONFDIR}/bashColors ~/.bashColors
cp ${CONFDIR}/startup.jl ~/.julia/config/startup.jl
ln -s ${CONFDIR}/beamerthemealui.sty ~/.texmf/tex/beamerthemealui.sty
ln -s ${CONFDIR}/asaproc.cls ~/.texmf/tex/asaproc.cls
ln -s ${CONFDIR}/template.tex ~/lib/tex_templates/tex/template.tex
ln -s ${CONFDIR}/template_asa.tex ~/lib/tex_templates/tex/template_asa.tex

# Copy these scripts to `~/bin`
cp ${BINDIR}/resources ~/bin
ln -s ${BINDIR}/dirsize ~/bin/dirsize
ln -s ${BINDIR}/gush ~/bin/gush
ln -s ${BINDIR}/sbtgen ~/bin/sbtgen
ln -s ${BINDIR}/sbt-cleanstage ~/bin/sbt-cleanstage
ln -s ${BINDIR}/combineJars ~/bin/combineJars
ln -s ${BINDIR}/beamergen ~/bin/beamergen
ln -s ${BINDIR}/asamdgen ~/bin/asamdgen
ln -s ${BINDIR}/pdfPage ~/bin/pdfPage
ln -s ${BINDIR}/newH ~/bin/newH
ln -s ${BINDIR}/zipit ~/bin/zipit
ln -s ${BINDIR}/texgen ~/bin/texgen
ln -s ${BINDIR}/metrogen ~/bin/metrogen
ln -s ${BINDIR}/captainslog ~/bin/captainslog

# top
# - To configure top to be human-readable, press `E` in top, then
#   to save, hit `W`. 
