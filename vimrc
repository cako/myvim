"FOR PATHOGEN
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"END PATHOGEN;

filetype plugin on 
set nocompatible

"Tex commands
au BufNewFile,BufRead *.tex call TexCommands()

"Html commands
au BufNewFile,BufRead *.html call HtmlCommands()

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


function TexCommands()
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
endfunction

function HtmlCommands()
    imap <leader>f <Esc>;w<CR><Esc>;!firefox % &<CR>
    map <leader>f ;w<CR><Esc>;!firefox % &<CR>
endfunction    

