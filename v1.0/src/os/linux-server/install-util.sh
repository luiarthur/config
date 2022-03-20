source $HOME/.bashrc
if [[ `which conda` ]]; then
  conda config --set auto_stack 1
  install_cmd_line_utils htop tree tmux ncurses
else
  cat $HOME/.bashrc
  echo "Conda is still not installed?!"
fi
