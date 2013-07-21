#! /bin/sh

if [ -f ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc-bk
fi

if [ -f ~/.gvimrc ]
then
  mv ~/.gvimrc ~/.gvimrc-bk
fi

path=`pwd`
ln -s $path/_vimrc ~/.vimrc
ln -s $path/_gvimrc ~/.gvimrc
