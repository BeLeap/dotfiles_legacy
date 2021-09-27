use str
use github.com/zzamboni/elvish-modules/alias

alias:new vz &use=[fzf] fzf:vz
alias:new cz &use=[fzf] fzf:cz
alias:new fif &use=[fzf] fzf:fif
alias:new fbr &use=[fzf] fzf:fbr
alias:new fdbr &use=[fzf] fzf:fdbr
alias:new fmbr &use=[fzf] fzf:fmbr
alias:new fcoc &use=[fzf] fzf:fcoc

fn vz []{
    file = (fd -i -tf | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "bat --theme 'gruvbox-dark' --style=numbers --color=always {} | head -100" --preview-window noborder)
    if (bool $file) {
        nvim $file
    }
}

fn cz []{
    directory = (fd -i -td | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "exa --tree --level=2 --color=always {}" --preview-window noborder)
    if (bool $directory) {
        cd $directory
    }
}

fn fif [keyword]{
    file = (rg --files-with-matches $keyword | fzf --border --height 80% --extended --ansi --reverse --cycle --header 'Find in File' --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --bind 'ctrl-v:execute(vim {} >/dev/tty </dev/tty)' --preview "bat --theme='gruvbox-dark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$argv[1]';or rg --ignore-case --pretty --context 10 '$argv[1]' {}" --preview-window noborder)
    if (bool $file) {
        nvim $file
    }
}

fn fbr []{
    branch = (to-lines [(git branch --list --all | grep -v HEAD)] | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git checkout (echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fn fdbr []{
    branch = (to-lines [(git branch --list --all | grep -v HEAD)] | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git branch -D (echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fn fmbr []{
    branch = (to-lines [(git branch --list --all | grep -v HEAD)] | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git merge (echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fn fcoc []{
    result = (git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}')
    git checkout $result
}