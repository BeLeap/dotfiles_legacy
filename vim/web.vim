let g:user_emmet_mode = 'a'
let g:user_emmet_leader_key='<C-Z>'
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['prettier', 'eslint'],
            \ 'typescript': ['prettier', 'eslint']
            \
            \}
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'typescript': ['eslint'],
            \'python': ['pylint', 'pyls'],
            \'rust': ['cargo', 'rls'],
            \'c': ['ccls', 'clangd'],
            \'cpp': ['ccls', 'clangd']
            \}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
