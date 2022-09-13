function gacp
    set -l inside_git_repo (git rev-parse --is-inside-work-tree 2>/dev/null)

    if $inside_git_repo
        git status
        read -p "echo 'Proceed[Y/n] >>> '" -l confirm

        switch $confirm
        case Y y
            git add .
            read -p "echo 'Message >>> '" -l msg
            git commit -m $msg
            read -p "echo 'Push[Y/n] >>> '" -l push

            switch $push
                case Y y
                    git push
                case '' N n
                    return 0
            end

        case '' N n
            return 1
        end
    end
end

function ggr
    cd (git rev-parse --show-toplevel)
end

abbr -a -g gco git checkout
abbr -a -g ga git add
abbr -a -g gst git status
abbr -a -g gl git pull
abbr -a -g gd git difftool
abbr -a -g gp git push
abbr -a -g gc git commit -v
abbr -a -g gf git fetch --prune --all
abbr -a -g adog git log --graph --decorate --oneline --all
