# Neovim
function vim
    nvim $argv
end

# Short-handed commands
function v
    vim $argv
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

# Build and Run
function ccr
    set -l file (echo "$argv" | cut -f 1 -d '.')
    gcc $argv -o $file
    ./$file
end

function cppcr
    set -l file (echo "$argv" | cut -f 1 -d '.')
    g++ $argv -o $file
    ./$file
end

function javacr
    set -l file (echo "$argv" | cut -f 1 -d '.')
    javac $argv
    java $file
end

function rustcr
    set -l file (echo "$argv" | cut -f 1 -d '.')
    rustc $argv
    ./$file
end

function npg
    npm $argv --prefix (git rev-parse --show-toplevel)
end

# Rust Commands
alias ls "exa"
alias ll "exa -l"
alias lt "exa -l -T -L2"

alias cat "bat"

alias od "hexyl"

alias grep "rg"

# Trash-cli
alias tput "trash-put"
alias tlist "trash-list";
alias tempty "trash-empty"

function rm
    echo 'This is not a command what you intended to run.'; printf 'Please use'; echo (set_color green) 'trash-put' (set_color normal); printf 'If you want to execute it, use'; echo (set_color red) '/bin/rm' (set_color normal)
end

# Pandoc
function pbuild
    set -l file (echo $argv | cut -f 1 -d '.')
    pandoc --template eisvogel --pdf-engine=xelatex $argv -o $file".pdf"
end

# for Windows Subsystem Linux
function open
    explorer.exe $argv
end

function psql
    command psql -U postgres -h localhost
end

function flutter
    command cmd.exe /c flutter $argv
end
