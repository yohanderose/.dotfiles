#!/bin/sh

# First install fish, tmux and vim/nvim using whatever package manager.
# Then npm, yarn and autopep8

# Create links to config files
rm ~/.config/fish/config.fish
rm ~/.config/nvim/init.vim
#rm ~/.vimrc
rm ~/.tmux.conf
echo source ~/.dotfiles/config.fish >> ~/.config/fish/config.fish
echo source ~/.dotfiles/init.vim >> ~/.config/nvim/init.vim
#echo so ~/.dotfiles/vimrc >> ~/.vimrc
echo so ~/.dotfiles/tmux.conf  >> ~/.tmux.conf

# Vim/Nvim packages
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa

# Starship prompt
yes | curl -fsSL https://starship.rs/install.sh | bash

# Install Minconda env manager
rm -rf $HOME/.miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
chmod +x miniconda.sh
bash miniconda.sh -b -p $HOME/.miniconda3
rm miniconda.sh

# Kite autocompletion
#yes | bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"
