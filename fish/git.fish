function gitlog
    git log --graph --decorate --oneline
end

function gacp
    git add *; and git commit -m $argv; and git push
end

function ggr
    cd (git rev-parse --show-toplevel)
end
