#!/bin/bash

mkdir ~/.vim/undodir
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source ~/.vim/vimrc" >> ~/.vimrc
vim +PluginInstall +qall

# cd ~/.vim/bundle/YouCompleteMe
# ./install.sh
