bash -i $HOME/.bashrc

# Command line utils to install:
install_cmd_line_utils() {
  cmd_line_utils=""
  for util in $@
  do
    [[ `which $util` ]] || cmd_line_utils="$cmd_line_utils $util"
  done
  conda install -c conda-forge $cmd_line_utils
}

if [[ `which conda` ]]; then
  conda config --set auto_stack 1
  install_cmd_line_utils htop tree tmux ncurses
else
  cat $HOME/.bashrc
  echo "Conda is still not installed?!"
fi
