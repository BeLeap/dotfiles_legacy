alias v "vim"
function vs
    vim src/"$argv"
end

function vm
    vim "main.$argv"
end

function c..
    cd ../
end

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

function clera 
    clear
end
function eixt 
    exit
end

function ccr
    echo "$argv" > ~/.ccr.tmp
    set -l file (cut -d '.' -f1 ~/.ccr.tmp)
    rm -f ~/.ccr.tmp
    gcc "$argv" -o "$file"
    ./"$file"
end

function javacr
    echo "$argv" > ~/.jcr.tmp
    set -l file (cut -d '.' -f1 ~/.jcr.tmp)
    rm -f ~/.jcr.tmp
    javac "$argv"
    java "$file"
end

function rustcr
    echo "$argv" > ~/.rcr.tmp
    set -l file (cut -d '.' -f1 ~/.rcr.tmp)
    rm -f ~/.rcr.tmp
    rustc "$argv"
    ./"$file"
end

# for Windows Subsystem Linux
alias guniv "cd /mnt/c/Users/ckdtj/University/"
alias start "cmd.exe /c start"

# Rust commands
alias ls "exa"
alias ll "exa -l"
alias lt "exa -l -T -L2"

alias cat "bat"

alias od "hexyl"

alias grep "rg"

alias ltclear "rm *.aux *.dvi *.log"
