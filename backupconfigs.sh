#! /bin/sh
cp ~/.vimrc ~/configs/.vimrc
cp ~/.bashrc ~/configs/.bashrc
cp ~/.tmux.conf ~/configs/.tmux.conf
cp ~/.config/qtile/config.py ~/configs/.config/qtile/config.py
mkdir ~/configs/.vim
mkdir ~/configs/.vim/after
mkdir ~/configs/.vim/colors
mkdir ~/configs/.vim/snippets
mkdir ~/configs/.vim/syntax
mkdir ~/configs/fish
cp -r ~/.vim/after/* ~/configs/.vim/after
cp -r ~/.vim/colors/* ~/configs/.vim/colors
cp -r ~/.vim/snippets/* ~/configs/.vim/snippets
cp -r ~/.vim/syntax/* ~/configs/.vim/syntax
cp -r ~/.config/fish/* ~/configs/fish/
