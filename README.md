README
======

Installation
------------

### With Git
Clone my repo:

    git clone git://github.com/cako/myvim.git ~/.vim
    
And install the submodules:

    cd ~/.vim
    git submodule init
    git submodule update

So far, the following plugins are registered as submodules:
* pathogen
* easymotion
* nercommenter
* nerdtree
* supertab
* vim-markdown
* w3cvalidate
* zen-coding

### Without Git
These next commands will get you my vim files, but it won't add all plugins.

    mkdir ~/.vim
    cd ~/.vim
    wget --no-check-certificate https://github.com/cako/myvim/tarball/master -O - | tar xz
    mv cako-myvim-*/* .
    rm -r cako-myvim-*/

After this is done, run `INSTALL.sh`: That will get you the rest of the plugins.

    cd .vim
    ./INSTALL.sh

### For both
Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

### And you are done!
