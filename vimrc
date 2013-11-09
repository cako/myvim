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
au BufRead,BufNewFile *.md set ft=mkd
au BufRead,BufNewFile *.cc set ft=cc.c
au BufRead,BufNewFile *.xhtml set ft=xhtml.html
au BufRead,BufNewFile *.htm set ft=htm.html
au BufRead,BufNewFile *.qrc set ft=xml
au BufNewFile,BufRead SConstruct set ft=python
au BufNewFile,BufRead .vim.custom set syntax=vim
au BufNewFile,BufRead * call CheckForCustomConfiguration()
"au FileType python compiler pylint
"au BufWritePost *.py !pyflakes %

""""""""""""""""""""""""""""""""""""""""""""""""
"               Mappings and such
""""""""""""""""""""""""""""""""""""""""""""""""

" Choose best suggestion and replace word with it
map <leader>z [sz=1<CR><CR><C-o>

" System clipboard interation
vmap <C-c> "+y
imap <C-v> <C-R>+

" Don't lose paste
xnoremap p pgvy

" Control backspace deletes word
imap <C-Backspace> <Esc>bdwi

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

" Save it goddamnit!
cmap w!! %!sudo tee > /dev/null %



""""""""""""""""""""""""""""""""""""""""""""""""
"               Set
""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set number

set history=1000

set spellsuggest=best,3
"setlocal spell spelllang=en_us
"setlocal spell spelllang=pt

set incsearch
set ignorecase
"set highlight
nnoremap <silent> <C-l> ;nohl<CR><C-l>

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

if has('gui_running')
    set background=light
    colorscheme PapayaWhip
else
    set background=dark
    colorscheme wombat
endif

""""""""""""""""""""""""""""""""""""""""""""""""
"               Functions
""""""""""""""""""""""""""""""""""""""""""""""""

function! CheckForCustomConfiguration()
    " Check for .vim.custom in the directory containing the newly opened file
    let custom_config_file = expand('%:p:h') . '/.vim.custom'
    if filereadable(custom_config_file)
        exe 'source' custom_config_file
    endif
endfunction
