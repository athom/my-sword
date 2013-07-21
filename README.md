## About 

This is my vim cofiguration, I put it to github for saving my time to copy&paste when switching machines. 

## Quick Start

#### One Line Installation

	```
	curl https://raw.github.com/athom/my-sword/master/install.sh | bash
	```


#### Manually Installation

1. Clone it 

     ```
     $ git clone http://github.com/athom/my-sword.git ~/.vim
     ``` 

2. Install [Vundle](https://github.com/gmarik/vundle)

     ```
	 git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
     ```

3. Link vimrc

	```
	ln -s ~/vim/_vimrc ~/.vimrc
	ln -s ~/vim/_gvimrc ~/.gvimrc
	```
	
4. Install plugins

	```
	vim +BundleInstall +qa
	```

## License

Released under the [WTFPL License](http://www.wtfpl.net/txt/copying).

