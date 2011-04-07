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
au BufNewFile,BufRead *.tex call TexCommands()
au BufNewFile,BufRead *.html call HtmlCommands()


""""""""""""""""""""""""""""""""""""""""""""""""
"               Mappings and such              
""""""""""""""""""""""""""""""""""""""""""""""""

map <C-Tab> ;tabnext<CR>
map <C-t> <Esc>;tabnew 

"Paste from clipboard
imap <C-v> <C-R>+

map <F9> ;NERDTreeToggle<CR>
imap <F9> <Esc>;NERDTreeToggle<CR>

map <F2> <Esc>;w<Enter><Esc>;!./%<Enter>
imap <F2> <Esc>;w<Enter><Esc>;!./%<Enter>

colorscheme PapayaWhip


""""""""""""""""""""""""""""""""""""""""""""""""
"               Set              
""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set number

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

set virtualedit=all
set mouse=a
                   
noremap ; :
noremap : ;

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
    set spellsuggest=best,3
    
    " Choose best suggestion and replace word with it
    map <leader>z ]sz=1<CR><CR>
     
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
