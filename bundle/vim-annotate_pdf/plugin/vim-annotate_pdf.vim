if exists("g:Annotate_pdf_is_loaded")
    finish
endif

let g:Annotate_pdf_is_loaded = 1
let s:annotate_pdf_file = substitute(expand('<sfile>:p:h'), "plugin", 'annotate_pdf/annotate_pdf.pl', '')

function! Run_annotate_pdf()
    if !exists("g:PDF_File_name")
        let g:PDF_File_name = substitute(expand("%"), "_mask\.tex", "\.pdf", "")
    endif
    execute '!perl ' . s:annotate_pdf_file . ' ' . g:PDF_File_name . ' ' . expand("%")
endfunction
