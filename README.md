README
======

Installation
------------

### With Git
Clone my repo:

    git clone git://github.com/cako/myvim.git ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
### Without Git
These next commands will get you my vim files, but it won't add all plugins.
I'm assuming you don't yet have a .vim directory. If you do, remove it.

    wget --no-check-certificate https://github.com/cako/myvim/tarball/master -O - | tar xz
    mv cako-myvim-* ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### For both
Create symlinks for the config files,

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

### And you are done!
