function gitlog
    git log --graph --decorate --oneline
end

function gacp
    set -l inside_git_repo (git rev-parse --is-inside-work-tree 2>/dev/null)

    if $inside_git_repo
        git status

        while true
            read -p "echo 'Proceed[Y/n]> '" -l confirm

            switch $confirm
            case Y y
                git add .
                read -p "echo 'Message> '" -l msg
                git commit -m $msg
                git push
                return 0
            case '' N n
                return 1
            end
        end
    end
end

function ggr
    cd (git rev-parse --show-toplevel)
end
