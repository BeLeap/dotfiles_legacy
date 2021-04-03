let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
let g:asynctasks_term_pos = 'tab'
nnoremap <C-c> :CocList tasks<CR>
let g:asyncrun_shell = 'cmd.exe'

let g:asyncrun_program = get(g:, 'asyncrun_program', {})
let g:asyncrun_program.custom = { opts -> 'cmd.exe' . opts.cmd }

