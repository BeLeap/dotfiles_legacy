let g:tex_flavor='latex'
autocmd BufWritePost *.tex !rm *.aux *.fls *.log *.synctex.gz *.fdb_latexmk
