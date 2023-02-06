highlight CRates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link CRates WarningMsg

au BufEnter *.spec.ts nnoremap <silent><F6> :lua require'jester'.debug()<CR>

set foldmethod=manual

if has('win32')
  let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
  nnoremap <leader>t :let $VIM_DIR=expand('%:p:h')<CR>:vsplit<CR>:terminal<CR>
else
  nnoremap <leader>t :let $VIM_DIR=expand('%:p:h')<CR>:vsplit<CR>:terminal cd $VIM_DIR; $SHELL<CR>
endif
