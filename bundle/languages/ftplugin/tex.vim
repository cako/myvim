setlocal backup
setlocal backupdir=~/.vim/backups

" Vim Conceal
"setlocal cole=1
hi Conceal guibg=PapayaWhip guifg=DarkRed
syn match texGreek '\\sqrt\>' contained conceal cchar=√

setlocal spell
" Underline wrong words
if has("gui_running")
else
    highlight clear SpellBad
    highlight SpellBad term=reverse cterm=underline
endif

setlocal textwidth=0
setlocal iskeyword+=\

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
setlocal iskeyword+=:

setlocal dictionary=~/.vim/bundle/vim-latex/ftplugin/latex-suite/dictionaries/dictionary
setlocal complete+=k

function! InsertBeamer()
    0r ~/Templates/Beamer\ Presentation.tex
    <C-j>
endfunction

function! InsertArticle()
    0r ~/Templates/LaTeX\ Article.tex
    <C-j>
endfunction

function! SetEnglishLanguage()
    setlocal spell spelllang=en_us   
endfunction

function! SetPortugueseLanguage()
    setlocal spell spelllang=pt   
endfunction

call SetPortugueseLanguage()

"LaTeX-Suite mappings
call IMAP('EFM', "\\begin{frame}\n\\frametitle{<++>}\n\\end{frame}", 'tex')
call IMAP('`o', "\\omega", 'tex')
call IMAP('ãst', "\\ast", 'tex')

imap EFM EFM<Esc>V>%i
"imap EIT EIT<Esc>V>A
