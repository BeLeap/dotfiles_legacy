alias gitlog "git log --graph --decorate --oneline"

function gacp
    git add .; and git commit -m $argv; and git push
end

alias ggr "cd (git rev-parse --show-toplevel)"
