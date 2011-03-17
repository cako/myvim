"FOR PATHOGEN
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"END PATHOGEN;

filetype plugin on 
set nocompatible

"Set key for html
au BufRead,BufNewFile *	if &ft == 'html' | imap <leader>f <Esc>;w<CR><Esc>;!firefox % &<CR> |  map <leader>f <Esc>;w<CR><Esc>;!firefox % &<CR>| endif

"Easy compiling for LaTeX
au BufRead,BufNewFile *	if &ft == 'tex' | imap <F2> <Esc>;w<CR><localleader>ll<localleader>lv | map <F2> ;w<CR><localleader>ll<localleader>lv | endif

"Set correct ã for tex
imap <localleader>a <C-K>a?
imap <C-a> <C-K>a^
imap <C-e> <C-K>e'

"Set t as newtab
map <C-t> <Esc>;tabnew 

"Past from clipboard
imap <C-v> <C-R>+

"Set spellcheck
set spell
"setlocal spell spelllang=en_us
setlocal spell spelllang=pt_br
set spellsuggest=best,3

"Line numbering
set nu

set smartindent
syntax on

"Incremental search
set incsearch

"Case insensitive search
set ic

"Highlight search
"set hls

" Show command as you type it
set showcmd

"Tabbing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"/Tabbing

"Allow wandering cursor
set virtualedit=all

"Allow mouse
set mouse=a

set showmode
"set wrapmargin=10

"FOR LATEX
set grepprg=grep\ -nH\ $*
filetype indent on
set iskeyword+=:
"END LATEX

"Run bindings
map <F2> <Esc>;w<Enter><Esc>;!./%<Enter>
imap <F2> <Esc>;w<Enter><Esc>;!./%<Enter>
                    
"Autocomplete bindings
"imap <Tab> <C-N>


"Change working directory to current file, except if it's /tmp
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | lcd %:p:h | endif

"Enable autocompletion like bash
set wildmenu
set wildmode=list:longest

"Swap ; and :
noremap ; :
noremap : ;
