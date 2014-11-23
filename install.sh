#!/bin/bash

mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/autoload

curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "source ~/.vim/vimrc" >> ~/.vimrc

vim +PlugInstall +qall
