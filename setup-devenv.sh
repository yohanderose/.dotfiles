#!/bin/sh

# First install fish, tmux and vim using whatever package manager.
# Then npm, yarn and yapf

# Create links to config files
rm ~/.config/fish/config.fish
rm ~/.vimrc
rm ~/.tmux.conf
echo source ~/.dotfiles/config.fish >> ~/.config/fish/config.fish
echo so ~/.dotfiles/vimrc >> ~/.vimrc
echo so ~/.dotfiles/tmux.conf  >> ~/.tmux.conf

# Vim packages
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# Starship prompt
yes | curl -fsSL https://starship.rs/install.sh | bash

# Install Minconda env manager
rm -rf $HOME/.miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
bash miniconda.sh -b -p $HOME/.miniconda3
rm miniconda.sh

# Kite autocompletion
yes | bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
