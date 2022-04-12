#!/bin/bash

# NOTE: This scripts installs jupyter and vim-bindings for it.

# Install jupyterlab.
conda install -c conda-forge jupyterlab

# Install vim bindings.
conda install -c conda-forge jupyterlab_vim
