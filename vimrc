call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'cako/vim-latex'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'ternjs/tern_for_vim'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'moll/vim-node'
"Plug 'scrooloose/syntastic'
"Plug 'Shougo/neocomplete'
call plug#end()
"Plug 'rkulla/pydiction'

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:neocomplete#enable_at_startup = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']


"let g:pydiction_location = '/home/cdacosta/.vim/plugged/pydiction/complete-dict'

" Remove docstring from jedi-vim
autocmd FileType python setlocal completeopt-=preview


""""""""""""""""""""""""""""""""""""""""""""""""
"               Mappings and such
""""""""""""""""""""""""""""""""""""""""""""""""

" Choose best suggestion and replace word with it
map <leader>z [sz=1<CR><CR><C-o>

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
"imap <C-V>		<Esc>"+gP<CR>i
imap <C-v> <C-R>+
map <C-V>		"+gP
cmap <C-V>		<C-R>+

map ≅ ≈
imap ≅ ≈
cmap ≅ ≈

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.
"exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG



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
