highlight CRates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link CRates WarningMsg

au BufEnter *.spec.ts nnoremap <silent><F6> :lua require'jester'.debug()<CR>

set foldmethod=manual
