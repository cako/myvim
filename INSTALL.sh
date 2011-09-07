#!/bin/bash
wget --no-check-certificate https://github.com/tpope/vim-pathogen/tarball/master -O - | tar xz
mv tpope-vim-pathogen-*/autoload/pathogen.vim autoload
rm -r tpope-vim-pathogen-*

declare -A plugins=( ["nerdcommenter"]="scrooloose"
                     ["nerdtree"]="scrooloose"
                     ["supertab"]="ervandew"
                     ["vim-easymotion"]="Lokaltog"
                     ["vim-markdown"]="plasticboy"
                     ["w3cvalidate"]="dekomote"
                     ["zen-coding"]="mattn" )
for plugin in "${!plugins[@]}"
do
    GITURL="https://github.com/${plugins["$plugin"]}/$plugin/tarball/master"
    wget --no-check-certificate $GITURL -O - | tar xz
    mv ${plugins["$plugin"]}-$plugin-*/* bundle/$plugin
    rm -r ${plugins["$plugin"]}-$plugin-*
done
