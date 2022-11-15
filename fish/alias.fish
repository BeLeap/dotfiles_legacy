# Neovim
alias vim "nvim"

# Short-handed commands
function l
    ll $argv
end
function v
    vim $argv
end
function p
    python3 $argv
end
function vs
    vim src/$argv
end
function vm
    vim "main.$argv"
end
function c..
    cd ../
end
function t
    tmux split-window "$argv"
end
function th
    tmux split-window -dh "$argv"
end
function tv
    tmux split-window -dv "$argv"
end
function j
    z $argv
end

# Configuration Files
function vimrc
    pushd $XDG_CONFIG_HOME/nvim && vim ./init.vim; popd
end
function fishrc
    pushd $XDG_CONFIG_HOME/fish && vim $XDG_CONFIG_HOME/fish/config.fish; popd
end
function sofish
    source $XDG_CONFIG_HOME/fish/config.fish
end
function tmuxconf
    pushd $DOTFILES_PATH/tmux && vim $DOTFILES_PATH/tmux/.tmux.conf; popd
end

# Typo
function clera
    clear
end
function eixt
    exit
end

function npg
    npm $argv --prefix (git rev-parse --show-toplevel)
end

# Rust Commands
alias ls "lsd"
alias ll "lsd -l"
alias lt "lsd -l -T -L2"

alias cat "bat"

alias od "hexyl"

# alias grep "rg"

# Trash-cli
#alias tput "trash-put"
#alias tlist "trash-list";
#alias tempty "trash-empty"

#function rm
#    echo 'This is not a command what you intended to run.'; printf 'Please use'; echo (set_color green) 'trash-put' (set_color normal); printf 'If you want to execute it, use'; echo (set_color red) '/bin/rm' (set_color normal)
#end

# Pandoc
function pbuild
    set -l file (basename $argv .md)
    pandoc $argv -o $file".pdf" --pdf-engine=xelatex --from markdown --listing
end

function dock
    docker start $argv
    docker attach $argv
end

alias nuget "mono /usr/local/bin/nuget.exe"
alias awslogin "saml2aws login -p default --skip-prompt"
alias vaultlogin "vault login -method=oidc -path=keycloak"

alias tf terraform

abbr -a -g dc docker compose

abbr -a -g k kubectl
abbr -a -g ktx kubectx
abbr -a -g kns kubens

alias gek "got -s 'en' -t 'ko' -o"
alias gke "got -s 'ko' -t 'en' -o"
