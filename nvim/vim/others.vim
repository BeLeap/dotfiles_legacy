let mapleader = ";"

set background=dark
colorscheme gruvbox

nnoremap <silent><leader>e :NvimTreeToggle<CR>
nnoremap <silent><leader>d :DBUIToggle<CR>
nnoremap <silent><leader>g :Neogit<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>sv :source $XDG_CONFIG_HOME/nvim/init.vim<CR>
inoremap <silent><leader>x <esc><CR>

set clipboard=unnamedplus

highlight CRates ctermfg=green ctermbg=NONE cterm=NONE
" or link it to another highlight group
highlight link CRates WarningMsg

let g:dashboard_default_executive='telescope.nvim'

nnoremap <silent><leader>f :Telescope find_files theme=dropdown<CR>
nnoremap <silent><leader>l :Telescope live_grep theme=dropdown<CR>
nnoremap <silent><leader>b :Telescope buffers theme=dropdown<CR>
nnoremap <silent><leader>h :Telescope help_tags theme=dropdown<CR>

nnoremap <silent><F9> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent><F5> :lua require'dap'.continue()<CR>
nnoremap <silent><F10> :lua require'dap'.step_over()<CR>
nnoremap <silent><F11> :lua require'dap'.step_into()<CR>
nnoremap <silent><leader>db :lua require'dapui'.toggle()<CR>

au BufEnter *.spec.ts nnoremap <silent><F6> :lua require'jester'.debug()<CR>

imap <silent><script><expr> <Right> copilot#Accept("\<Right>")
let g:copilot_no_tab_map = v:true
