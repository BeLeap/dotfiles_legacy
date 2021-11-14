let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

nnoremap <silent><leader>e :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction
