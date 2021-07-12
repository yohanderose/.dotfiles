#!/bin/sh

# First install fish, tmux and vim/nvim using whatever package manager.
# Then npm/yarn, hub, fzf and gnome-system-monitor  
# THEN pulseaudio and pavucontrol

# Create links to config files
rm -rf ~/.config/fish
rm -rf ~/.config/nvim
rm -rf ~/.config/i3
#rm ~/.vimrc
rm ~/.tmux.conf
mkdir ~/.config/fish
mkdir ~/.config/nvim
mkdir ~/.config/i3
echo source ~/.dotfiles/config.fish >> ~/.config/fish/config.fish
echo source ~/.dotfiles/init.vim >> ~/.config/nvim/init.vim
#echo so ~/.dotfiles/vimrc >> ~/.vimrc
echo so ~/.dotfiles/tmux.conf  >> ~/.tmux.conf
ln -s ~/.dotfiles/i3-config ~/.config/i3/config

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
#if [[ "$OSTYPE" == "linux-gnueabi"* ]]; then
#	# RPi
#	wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh -O miniconda.sh
#else
#	# non-arm x64linux
#	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
#fi
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
bash miniconda.sh -b -p $HOME/.miniconda3
rm miniconda.sh
rm ~/.condarc
ln ~/.dotfiles/condarc ~/.condarc

# Install git workflow 
pip install -U Commitizen autopep8 pylint
rm ~/.gitconfig
ln ~/.dotfiles/.gitconfig ~/.gitconfig

# Link snippets into coc-snippet config
ln -f snippets/markdown.snippets ~/.config/coc/ultisnips/markdown.snippets

# Install bumblebee status bar and picom (i3)
rm ~/.config/picom
mkdir ~/.config/picom
# yay -S picom-ibhagwan-git --confirm  
ln -s ~/.dotfiles/picom.conf ~/.config/picom/picom.conf 
pip install bumblebee-status psutil netifaces

# Set keyboard repeat (50) and delay (150ms) 
#echo xset r rate 150 50 >> ~/.xprofile                                                

