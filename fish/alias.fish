alias v "nvim"
alias vim "nvim"
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

alias lear "clear"

function clera
    clear
end
function eixt
    exit
end

function ccr
    echo "$argv" > ~/.ccr.tmp
    set -l file (cut -d '.' -f1 ~/.ccr.tmp)
    /bin/rm -f ~/.ccr.tmp
    gcc "$argv" -o "$file"
    ./"$file"
end

function cppcr
    echo "$argv" > ~/.cppcr.tmp
    set -l file(cut -d '.' -f1 ~/.ccr.tmp)
    /bin/rm -f ~/.cppcr.tmp
    g++ "$argv" -o "$file"
    ./"$file"
end

function javacr
    echo "$argv" > ~/.jcr.tmp
    set -l file (cut -d '.' -f1 ~/.jcr.tmp)
    /bin/rm -f ~/.jcr.tmp
    javac "$argv"
    java "$file"
end

function rustcr
    echo "$argv" > ~/.rcr.tmp
    set -l file (cut -d '.' -f1 ~/.rcr.tmp)
    /bin/rm -f ~/.rcr.tmp
    rustc "$argv"
    ./"$file"
end

alias rm "echo 'This is not a command what you intended to run.'; printf 'Please use'; echo (set_color green) 'trash-put' (set_color normal); printf 'If you want to execute it, use'; echo (set_color red) '/bin/rm' (set_color normal)"

# for Windows Subsystem Linux
alias start "cmd.exe /c start"
alias open "explorer.exe"

# Rust commands
alias ls "~/.dotfiles/bin/exa"
alias ll "~/.dotfiles/bin/exa -l"
alias lt "~/.dotfiles/bin/exa -l -T -L2"

alias cat "~/.dotfiles/bin/bat"

alias od "~/.dotfiles/bin/hexyl"

alias grep "~/.dotfiles/bin/rg"

# Latex
alias ltclear "rm *.aux *.fdb_latexmk *.synctex.gz *.fls *.log"

# Trash-cli
alias tput "trash-put"
alias tlist "trash-list";
alias tempty "trash-empty"
