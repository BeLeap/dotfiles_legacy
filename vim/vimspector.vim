let g:vimspector_enable_mappings='HUMAN'
nnoremap <leader>e :VimspectorReset<CR>

sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

autocmd BufReadPre,FileReadPre *.c,*.cpp silent! !cp ~/.dotfiles/vim/spector/cpp.json ./.vimspector.json &
autocmd BufReadPre,FileReadPre *.py silent! !cp ~/.dotfiles/vim/spector/python.json ./.vimspector.json &
