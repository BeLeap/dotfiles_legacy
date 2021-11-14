let mapleader = ";"

colorscheme gruvbox

nnoremap <silent><leader>e :NvimTreeToggle<CR>
nnoremap <silent><leader>d :DBUIToggle<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>sv :source ~/.config/nvim/init.vim<CR>

set clipboard=unnamedplus

highlight Crates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link Crates WarningMsg

nnoremap <leader>fg <cmd>Telescope live_grep<cr>

