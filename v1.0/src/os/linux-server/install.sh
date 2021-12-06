current_dir=$PWD

# Install conda if not installed.
if [[ `which conda` == "" ]]
then
  mkdir -p ~/tmp/conda-install
  cd ~/tmp/conda-install
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
  bash Miniconda3-latest-Linux-x86_64.sh 
  rm -rf ~/tmp/conda-install
fi


# Install tree if not installed.
# TODO: Get latest appimage?
[[ `which tree` ]] || conda install -c conda-forge tree

# Install htop if not installed.
# TODO: Get latest appimage?
[[ `which htop` ]] || conda install -c conda-forge htop

# Install neovim if not installed.
# [[ `which neovim` ]] || conda install -c conda-forge neovim
[[ `which neovim` ]] || wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O ~/bin/nvim
chmod +x ~/bin/nvim

# Download nvim-config and setup.
git clone https://github.com/luiarthur/nvim-config ~/repo/nvim-config
cd ~/repo/nvim-config && make install
cd $current_dir

# Install tmux if not installed.
# [[ `which neovim` ]] || conda install -c conda-forge tmux
# TODO: Get latest appimage?
[[ `which tmux` ]] || wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b-x86_64.AppImage -O ~/bin/tmux
chmod +x ~/bin/tmux

# Install tmux plugin manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
