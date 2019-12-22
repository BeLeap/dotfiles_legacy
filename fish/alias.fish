alias v "vim"

function vs
    vim src/"$argv"
end

alias vimrc "vim ~/.vimrc"
alias fishrc "vim ~/.config/fish/config.fish"
alias sofish "source ~/.config/fish/config.fish"
alias clera "clear"
alias eixt "exit"
alias vm "vim main.*"
alias tmuxconf "vim ~/.tmux.conf"

alias gcm "gcc main.c -o main"
alias gcmg "gcc main.c -g -o main"
alias gdm "gdb main"

alias valm "valgrind ./main"

alias goset "cd ~/dotfiles"

alias spac "sudo pacman"
alias spac-install "sudo pacman -S"
alias spac-update "sudo pacman -Syu"
alias spac-remove "sudo pacman -R"
alias spac-clean "sudo pacman -Rns (pacman -Qtdq)"

alias server "ssh ckdtj1012@ckdtj.kro.kr"

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

alias cargobr "cargo build; cargo run"

# for Windows Subsystem Linux
alias guniv "cd /mnt/c/Users/ckdtj/University/"
