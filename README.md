README
======

Pre-Requisites
--------------
A lot of these plugins require one thing or another.
So far, the only thing I haven't found packaged in Ubuntu repositories is
Perl::Tags, needed for perl-support.
It can be found [right here](http://search.cpan.org/~osfameron/Perl-Tags-0.23/lib/Perl/Tags.pm).

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
I'm assuming you don't yet have a .vim directory. If you do, remove it.

    wget --no-check-certificate https://github.com/cako/myvim/tarball/master -O - | tar xz
    mv cako-myvim-* ~/.vim

After this is done, run `INSTALL.sh`: That will get you the rest of the plugins.

    cd ~/.vim
    ./INSTALL.sh

### For both
Create symlinks for the config files,

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

and also for the perl-support to play nice with Pathogen:
    
    ln -s ~/.vim/bundle/perl-support/perl-support/ ~/.vim/perl-support

### And you are done!
