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
[[ `which tree` ]] || conda install -c conda-forge tree

# Install htop if not installed.
[[ `which htop` ]] || conda install -c conda-forge htop

# Install neovim if not installed.
[[ `which neovim` ]] || conda install -c conda-forge neovim