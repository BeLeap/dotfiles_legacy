if $XDG_CONFIG_HOME != ""
  set runtimepath^=$XDG_CONFIG_HOME/nvim/lua
  let &packpath=&runtimepath

  set runtimepath^=$XDG_CONFIG_HOME/nvim/site
  let &packpath=&runtimepath
else
  set runtimepath^=~/.config/nvim/lua
  let &packpath=&runtimepath

  set runtimepath^=~/.config/nvim/site
  let &packpath=&runtimepath
endif

lua require('impatient')
lua require('boot')

source $XDG_CONFIG_HOME/nvim/vim/others.vim
source $XDG_CONFIG_HOME/nvim/vim/rzip.vim
source $XDG_CONFIG_HOME/nvim/vim/dbui.vim

