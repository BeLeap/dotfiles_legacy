# Neovim
alias vim "nvim"

# Short-handed commands
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

# Configuration Files
function vimrc
    vim ~/.vimrc
end
function fishrc
    vim ~/.config/fish/config.fish
end
function sofish
    source ~/.config/fish/config.fish
end
function tmuxconf
    vim ~/.tmux.conf
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
alias ls "~/.dotfiles/bin/exa"
alias ll "~/.dotfiles/bin/exa -l"
alias lt "~/.dotfiles/bin/exa -l -T -L2"

alias cat "~/.dotfiles/bin/bat"

alias od "~/.dotfiles/bin/hexyl"

alias grep "~/.dotfiles/bin/rg"

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

# for Windows Subsystem Linux
function open
    set -l file (echo $argv | rev | cut -f 1 -d '/' | rev)
    if [ ! -z "$path" ]
        echo "Incorrect parameter."
        return 1;
    end
    set -l curr (pwd)
    set -l targ (echo $argv | rev | cut -f 2- -d '/' | rev)
    if [ $file = $targ ]
        explorer.exe $file
    else
        cd $targ
        explorer.exe $file
        cd $curr
    end
end

function dock
    docker start $argv
    docker attach $argv
end
