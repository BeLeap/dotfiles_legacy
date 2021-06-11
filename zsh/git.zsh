gacp() {
    local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [[ ! -z $inside_git_repo ]] 
    then
        git status
        read "yn?Proceed?(Y/n) "
        case "$yn" in
            y|Y )
                git add .
                read "message?Enter commit message: "
                git commit -m $message
                read "yn?Push?(Y/n) "
                case "$yn" in
                    y|Y )
                        git push
                    ;;
                esac
            ;;
        esac
    fi
}
