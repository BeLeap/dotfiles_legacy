if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    set -x EDITOR hx

    alias sofish "source ~/.config/fish/config.fish"

    abbr gst "git status"
    abbr gsw "git switch"
    abbr gd "git diff"
    abbr ga "git add"
    abbr gc "git commit -v"
    abbr gac "git commit -av"
    abbr gp "git push"
    abbr gf "git fetch --prune --all"
    abbr gl "git pull"
    abbr gco "git checkout"

    abbr k "kubectl"
    abbr ktx "kubectx"
    abbr kns "kubens"

    starship init fish | source
end