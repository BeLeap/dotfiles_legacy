let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'tab'
nnoremap <leader>b :AsyncTask file-build<CR>
nnoremap <leader>r :AsyncTask file-run<CR>
nnoremap <C-c> :CocList tasks<CR>
