## About 

This is my vim cofiguration, I put it to github for saving my time to copy&paste when switching machines. 

## Quick Start

1. Clone it 

     ```
     $ git clone http://github.com/athom/my-sword.git ~/.vim
     ``` 

2. Install and Configure [Vundle]

     ```
     cd ~/.vim; ./install.sh
     ```

3. Link vimrc files to your home

     ```
     $ cd ~
     $ ln -s ~/.vim/_vimrc .vimrc 
     $ ln -s ~/.vim/_gvimrc .gvimrc
     ```

     NOTE: you'd better backup your local .vimrc and .gvimrc files first. 
     For Windows user, .vimrc should be _vimrc, .gvimrc should be _gvimrc

4. Install vim plugins 

     There is a file named VundleFile under .vim folder, it already includes many powerful plugins. You can add more or disable some. After you feel comfortable with it, save it, relaunch vim and run vim command ':BundleInstall'. Now you can have a break and later you will a powerful enviroment for hacking! 

Happy Vimming!

