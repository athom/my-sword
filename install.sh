#! /bin/sh


# install vundle
if [ ! -d ~/.vim/bundle/vundle ]
then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# rename .vimrc
if [ -f ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc-bk
fi

# rename .gvimrc
if [ -f ~/.gvimrc ]
then
  mv ~/.gvimrc ~/.gvimrc-bk
fi

# link configurations
path=`pwd`
ln -s $path/_vimrc ~/.vimrc
ln -s $path/_gvimrc ~/.gvimrc

# install plugins
vim +BundleInstall +qa
