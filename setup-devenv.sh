#!/bin/sh

# First install fish, tmux and vim/nvim using whatever package manager.
# Then npm/yarn, hub

# Create links to config files
rm -rf ~/.config/fish
rm -rf ~/.config/nvim
#rm ~/.vimrc
rm ~/.tmux.conf
mkdir ~/.config/fish
mkdir ~/.config/nvim
echo source ~/.dotfiles/config.fish >> ~/.config/fish/config.fish
echo source ~/.dotfiles/init.vim >> ~/.config/nvim/init.vim
#echo so ~/.dotfiles/vimrc >> ~/.vimrc
echo so ~/.dotfiles/tmux.conf  >> ~/.tmux.conf

# Vim/Nvim packages
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# NodeJS for Coc
curl -sL install-node.now.sh/lts | sudo bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa

# Starship prompt
yes | curl -fsSL https://starship.rs/install.sh | bash

# Install Minconda env manager
rm -rf $HOME/.miniconda3
if [[ "$OSTYPE" == "linux-gnueabi"* ]]; then
	# RPi
	wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh -O miniconda.sh
else
	# non-arm x64linux
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
fi
chmod +x miniconda.sh
bash miniconda.sh -b -p $HOME/.miniconda3
rm miniconda.sh

# Install rest of workflow 
pip3 install -U Commitizen autopep8 pylint
rm ~/.gitconfig
ln ~/.dotfiles/.gitconfig ~/.gitconfig
