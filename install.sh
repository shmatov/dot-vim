#!/bin/bash

mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/bundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "source ~/.vim/vimrc" >> ~/.vimrc

vim +PluginInstall +qall

python3 ~/.vim/bundle/YouCompleteMe/install.py --gocode-completer --clang-completer
