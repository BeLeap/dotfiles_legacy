let g:gitgutter_max_signs = 1000
set statusline=...%{battery#component()}...
set tabline=...%{battery#component()}...
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! CurrentTime()
    return strftime('%c')
endfunction

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus',  'treesitter', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'battery', 'time' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'battery': 'battery#component',
      \   'time': 'CurrentTime',
      \   'treesitter': 'nvim_treesitter#statusline',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set noshowmode
let g:buftabline_numbers=2
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
