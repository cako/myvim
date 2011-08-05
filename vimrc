""""""""""""""""""""""""""""""""""""""""""""""""
"               Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


""""""""""""""""""""""""""""""""""""""""""""""""
"               Filetype
""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
set nocompatible
au BufRead,BufNewFile *.tex call TexCommands()
au BufRead,BufNewFile *.html,*.htm,*.xhtml call HtmlCommands()
au BufRead,BufNewFile *.py call PythonCommands()
au BufRead,BufNewFile *.pl call PerlCommands()
au FileType python compiler pylint
"au BufWritePost *.py !pyflakes %

""""""""""""""""""""""""""""""""""""""""""""""""
"               Mappings and such
""""""""""""""""""""""""""""""""""""""""""""""""

" Choose best suggestion and replace word with it
map <leader>z bb]sz=1<CR><CR>

"System clipboard interation
vmap <C-c> "+y
imap <C-v> <C-R>+

map <F9> ;NERDTreeToggle<CR>
imap <F9> <Esc>;NERDTreeToggle<CR>

map <F2> ;w<CR><Esc>;!chmod a+x %<CR><Esc>;!./%<CR>
imap <F2> <Esc>;w<CR><Esc>;!chmod a+x %<CR><Esc>;!./%<CR>

map <C-Tab> ;tabnext<CR>
map <S-C-Tab> ;tabprevious<CR>

map <C-t> <Esc>;tabnew 
map <leader>vim ;tabnew ~/.vimrc<CR>

noremap ; :
noremap : ;

if has("gui_running")
    colorscheme PapayaWhip
else
    colorscheme desert
endif



""""""""""""""""""""""""""""""""""""""""""""""""
"               Set
""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set number

set spellsuggest=best,3

set incsearch
set ignorecase
"set highlight

set showcmd
set showmode

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set wrapmargin=10
set expandtab
set listchars=eol:$,tab:>-,trail:▹,extends:>,precedes:<

set virtualedit=all
set mouse=a

"Change working directory to current file, except if it's /tmp
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h | endif

"Enable autocompletion like bash
set wildmenu
set wildmode=list:longest

""""""""""""""""""""""""""""""""""""""""""""""""
"               Functions
""""""""""""""""""""""""""""""""""""""""""""""""

function TexCommands()
    set spell
    "setlocal spell spelllang=en_us
    setlocal spell spelllang=pt_br

    imap <F2> <Esc>;w<CR><localleader>ll<localleader>lv 
    map <F2> ;w<CR><localleader>ll<localleader>lv

    imap <F3> <Esc>;w<CR><localleader>ll;!sage %:r.sage<CR><F2>
    map <F3> ;w<CR><localleader>ll;!sage %:r.sage<CR><F2>

    imap <localleader>a <C-K>a?
    imap <C-a> <C-K>a^
    imap <C-e> <C-K>e'

    "For vim-latex
    set grepprg=grep\ -nH\ $*
    filetype indent on
    set iskeyword+=:

    set dictionary=~/.vim/bundle/vim-latex/ftplugin/latex-suite/dictionaries/dictionary
    set complete+=k
endfunction

function HtmlCommands()
    map <F2> ;w<CR><Esc>;!firefox % &<CR>
    imap <F2> <Esc>;w<CR><Esc>;!firefox % &<CR>
    map <F3> ;w<CR><Esc>;W3cValidate<CR>
    imap <F3> <Esc>;w<CR><Esc>;W3cValidate<CR>

endfunction

function PythonCommands()
    set noignorecase
    set list
    set textwidth=80

    command! -nargs=0 Pydoc exe '!pydoc' @
    map  <localleader>pd yiw;Pydoc<CR>
    imap <localleader>pd <Esc>yiw;Pydoc<CR>
    map <F3> ;w<CR>;!chmod a+x<CR>;!python %
    imap <F3> <Esc>;w<CR>;!chmod a+x<CR>;!python %
    map <M-F3> ;w<CR>;!python<Up><CR>
    imap <M-F3> <Esc>;w<CR><Esc>;!python<Up><CR>
    map <localleader>li ;set invlist<CR>

    let g:pydiction_location = '~/.vim/bundle/after/ftplugin/pydiction/complete-dict'
endfunction

function PerlCommands()
    map <F3> ;w<CR>;!chmod a+x<CR>;!./% 
    imap <F3> <Esc>;w<CR>;!chmod a+x<CR>;!./% 
    map <M-F3> ;w<CR>;!./%<Up><CR>
    imap <M-F3> <Esc>;w<CR><Esc>;!./<Up><CR>
endfunction
