if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings

    set -x EDITOR hx

    alias sofish "source ~/.config/fish/config.fish"

    starship init fish | source
end
