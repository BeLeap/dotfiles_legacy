let g:tex_flavor='latex'
autocmd BufWritePost *.tex !pdflatex <afile> > /dev/null 2>&1; rm -f *.aux *.log

