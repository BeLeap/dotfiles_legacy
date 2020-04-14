alias gitlog "git log --graph --decorate --oneline"

function gacp
    git add .; git commit -m $argv; git push
end

alias ggr "cd (git rev-parse --show-toplevel)"
