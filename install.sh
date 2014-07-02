#!/usr/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source ~/.vim/vimrc" >> ~/.vimrc
vim +PluginInstall +qall

# Patching
gsed -e '/snippet\s\./,+1d' -i ~/.vim/bundle/vim-snippets/snippets/python.snippets
