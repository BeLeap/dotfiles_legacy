let mapleader = ";"

if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
" let g:gruvbox_material_enable_italic = 0

colorscheme gruvbox-material

nnoremap <silent><leader>e :CHADopen<CR>
nnoremap <silent><leader>d :DBUIToggle<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>sv :source $XDG_CONFIG_HOME/nvim/init.vim<CR>

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

inoremap <silent>,d <ESC>
nnoremap <silent>,d <ESC>
onoremap <silent>,d <ESC>

let g:EditorConfig_core_mode = 'external_command'
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

set foldmethod=manual
