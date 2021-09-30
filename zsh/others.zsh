export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#e5e9f0,bg=#4c566a,bold,underline"
export VAULT_ADDR=https://vault.riiid.cloud
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt no_list_ambiguous
setopt MENU_COMPLETE

bindkey '^X' create_completion
