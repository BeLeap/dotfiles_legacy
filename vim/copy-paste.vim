" copy (write) highlighted text to .vimbuffer
vmap <leader>c y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <leader>v :r ~/.vimbuffer<CR>"
