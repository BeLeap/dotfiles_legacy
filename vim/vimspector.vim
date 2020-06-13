nmap <F2> <Plug>VimspectorToggleBreakpoint
nmap <F9> <Plug>VimspectorContinue
nmap <F8> <Plug>VimspectorStepOver
nmap <F7> <Plug>VimspectorStepInto

nnoremap <leader>e :VimspectorReset<CR>

sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

autocmd BufReadPre,FileReadPre *.c,*.cpp silent! !cp ~/.dotfiles/vim/spector/cpp.json ./.vimspector.json &
autocmd BufReadPre,FileReadPre *.py silent! !cp ~/.dotfiles/vim/spector/python.json ./.vimspector.json &
autocmd BufReadPre,FileReadPre *.rs silent! !cp ~/.dotfiles/vim/spector/rust.json ../.vimspector.json &
autocmd VimLeave *.c,*.cpp,*.pysilent !/bin/rm .vimspector.json
autocmd VimLeave *.rs !/bin/rm ../.vimspector.json
