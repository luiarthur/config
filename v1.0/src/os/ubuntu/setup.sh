#!/bin/bash

CONFDIR="$PWD/../../conf/"
BINDIR="$PWD/../../conf/"

# Make directories if needed.
mkdir -p ~/bin/
mkdir -p ~/lib/R_lib/
mkdir -p ~/.texmf/tex/ # for custom beamer theme
mkdir -p ~/lib/tex_templates/tex/ # for default latex files
mkdir -p ~/.R/
mkdir -p ~/.ssh/
mkdir -p ~/.julia/config/

# Copy these configuration files to the right place
cp ${CONFDIR}/bashrc ~/.bashrc
cp ${CONFDIR}/git-prompt.sh ~/.git-prompt.sh
cp ${CONFDIR}/gitconfig ~/.gitconfig
cp ${CONFDIR}/gitignore_global ~/.gitignore_global
cp ${CONFDIR}/pythonrc ~/.pythonrc
cp ${CONFDIR}/R-Makevars ~/.R/Makevars
cp ${CONFDIR}/Renviron ~/.Renviron
cp ${CONFDIR}/Rprofile ~/.Rprofile
cp ${CONFDIR}/ssh_config ~/.ssh/config
cp ${CONFDIR}/tmux.conf ~/.tmux.conf
cp ${CONFDIR}/startup.jl ~/.julia/config/startup.jl

# Copy these scripts to `~/bin`
cp ${BINDIR}/resources ~/bin
ln -s ${BINDIR}/mouse-reset ~/bin
ln -s ${BINDIR}/dirsize ~/bin/dirsize
ln -s ${BINDIR}/gush ~/bin/gush
ln -s ${BINDIR}/md ~/bin/md
ln -s ${BINDIR}/sbtgen ~/bin/sbtgen
ln -s ${BINDIR}/sbt-cleanstage ~/bin/sbt-cleanstage
ln -s ${BINDIR}/combineJars ~/bin/combineJars
ln -s ${BINDIR}/mdgen ~/bin/mdgen
ln -s ${BINDIR}/beamergen ~/bin/beamergen
ln -s ${BINDIR}/asamdgen ~/bin/asamdgen
ln -s ${BINDIR}/pdfPage ~/bin/pdfPage
ln -s ${BINDIR}/newH ~/bin/newH
ln -s ${BINDIR}/zipit ~/bin/zipit
ln -s ${BINDIR}/texgen ~/bin/texgen
ln -s ${BINDIR}/metrogen ~/bin/metrogen
ln -s ${BINDIR}/captainslog ~/bin/captainslog
ln -s ${BINDIR}/jltag ~/bin/jltag
ln -s ${BINDIR}/bib2json ~/bin/bib2json

### For midi keyboard / synthesizer / midiculous, etc ###
ln -s ${BINDIR}/zyn ~/bin/zyn
ln -s ${BINDIR}/audio-reset ~/bin/audio-reset

# top
# - To configure top to be human-readable, press `E` in top, then
#   to save, hit `W`. 