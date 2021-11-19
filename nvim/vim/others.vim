let mapleader = ";"

colorscheme nord

nnoremap <silent><leader>e :NvimTreeToggle<CR>
nnoremap <silent><leader>d :DBUIToggle<CR>
nnoremap <silent><leader>g :Neogit<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>sv :source ~/.config/nvim/init.vim<CR>

set clipboard=unnamedplus

highlight CRates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link CRates WarningMsg

nnoremap <leader>fg <cmd>Telescope live_grep<CR>

let g:dashboard_default_executive='telescope.nvim'

nnoremap <silent><leader>f :lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>l :lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>b :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><leader>h :lua require('telescope.builtin').help_tags()<CR>
