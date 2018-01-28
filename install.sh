#!/bin/bash

mkdir -p ~/.vim/undodir

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "source ~/.vim/vimrc" >> ~/.vimrc

vim +PlugInstall +qall
