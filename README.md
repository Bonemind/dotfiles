Dotfiles
=======

Dotfile repository

There are many like it, but this one is mine

## Setup

```
git clone git@github.com:Bonemind/dotfiles.git
chmod +x ./stowdotfiles.sh
./stowdotfiles.sh

# Dein setup
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundle/dein.vim

# Acquire a powerline/nerd patched font
# e.g: https://github.com/ryanoasis/nerd-fonts

# Acquire TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Init submodules
git submodule update --init --recursive
```
