if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    set -x EDITOR nvim

    alias sofish "source ~/.config/fish/config.fish"
    alias docker "podman"

    abbr v "nvim"

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

    abbr gmd "gh pr merge -d"

    if type -q starship 
        starship init fish | source
    end
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q lsd
        alias ls "lsd"
        alias ll "lsd -l"
        alias lla "lsd -la"
    end

    if type -q nodenv
        source (nodenv init -|psub)
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q carapace
        carapace _carapace | source
    end
end
