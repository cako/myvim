set path+=/usr/lib/openmpi/include,

silent !ctags -e --c-kinds=+defglmpstuvx -R -o %:p:h/tags %:p:h/*.c
silent !ctags --c-kinds=+defglmpstuvx -R -a %:p:h/tags %:p:h/*.h
set tags=./tags,~/.vim/bundle/tags/mpitags

map <C-s> <C-w><C-]>
imap <C-s> <Esc><C-w><C-]>

map <F4> ;w<CR>;!gcc %:p -o %:p:rC -lmpi -I/usr/lib/openmpi/include -I/usr/lib/openmpi/include/openmpi && mpirun -np 4 %:p:rC<CR>
imap <F4> <Esc>;w<CR>;!gcc %:p -o %:p:rC -lmpi -I/usr/lib/openmpi/include -I/usr/lib/openmpi/include/openmpi && mpirun -np 4 %:p:rC<CR>

map <F5> ;Tlist<CR><C-w><C-w>
imap <F5> <Esc>;Tlist<CR><C-w><C-w>
