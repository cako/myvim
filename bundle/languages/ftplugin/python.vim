setlocal noignorecase
setlocal list
setlocal textwidth=80
setlocal dictionary+=~/.vim/bundle/after/ftplugin/pydiction/complete-dict
"Only on project files! Better to include these commands in .vim.custom
"silent !ctags -R -o %:p:h/tags %:p:h
"let &tags = expand("%:p:h") . "/tags"

command! -nargs=0 Pydoc exe '!pydoc' @
map  <localleader>pd yiw;Pydoc<CR>
imap <localleader>pd <Esc>yiw;Pydoc<CR>
map <F3> ;w<CR>;!chmod a+x<CR>;!python %
imap <F3> <Esc>;w<CR>;!chmod a+x<CR>;!python %
map <M-F3> ;w<CR>;!python<Up><CR>
imap <M-F3> <Esc>;w<CR><Esc>;!python<Up><CR>
map <localleader>li ;set invlist<CR>
" Close omnicomplete window after choosing word
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

function! InsertPython()
    0r ~/Templates/Python\ Template.py
    <C-j>
endfunction
