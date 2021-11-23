function vz
	set -l file (fd -i . | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "bat --theme 'gruvbox-dark' --style=numbers --color=always {} | head -100" --preview-window noborder)
	if [ ! -z "$file" ]
		vim $file
	end
end

function cz
	set -l directory (fd -i -td | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "exa --tree --level=2 --color=always {}" --preview-window noborder)
        if [ ! -z "$directory" ]
	    cd $directory
        end
end

function ch
    set -l directory (fd -i -td . ~/ | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "exa --tree --level=2 --color=always {}" --preview-window noborder)
    if [ ! -z "$directory" ]
        cd $directory
    end
end

function vg
	set -l file (fd -i . (git rev-parse --show-toplevel)| fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "bat --theme 'gruvbox-dark' --style=numbers --color=always {} | head -100" --preview-window noborder)
	if [ ! -z "$file" ]
		vim $file
	end
end

function cg
	set -l directory (fd -i -td . (git rev-parse --show-toplevel)| fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "exa --tree --level=2 --color=always {}" --preview-window noborder)
	if [ ! -z "$directory" ]
		cd $directory
	end
end

# for Windows Subsystem for Linux
function cwh
    set -l directory (fd -i -td . ~/winhome/ | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "exa --tree --level=2 --color=always {}" --preview-window noborder)
    if [ ! -z "$directory" ]
        cd $directory
    end
end

function vwh
    set -l file (fd -i . ~/winhome | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --preview "bat --theme 'gruvbox-dark' --style=numbers --color=always {} | head -100" --preview-window noborder)
    if [ ! -z "$file" ]
        vim $file
    end
end

function fif
    if count $argv > /dev/null
       set -l file (rg --files-with-matches "$argv[1]" | fzf --border --height 80% --extended --ansi --reverse --cycle --header 'Find in File' --bind 'ctrl-u:preview-up,ctrl-d:preview-down' --bind 'ctrl-v:execute(vim {} >/dev/tty </dev/tty)' --preview "bat --theme='gruvbox-dark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$argv[1]';or rg --ignore-case --pretty --context 10 '$argv[1]' {}" --preview-window noborder)
       if [ ! -z "$file" ]
           vim $file
       end
    else
        echo "검색어를 입력해주세요"
    end
end

function fzf-bcd-widget -d 'cd backwards'
	pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
	[ $result ]; and cd $result
	commandline -f repaint
end

function fbr -d "Fuzzy-find and checkout br"
    set -l branches (git branch --list --all | grep -v HEAD)
    set -l branch (string join \n $branches | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git checkout (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
end

function fdbr -d "Fuzzy-find and delete br"
    set -l branches (git branch --list)
    set -l branch (string join \n $branches | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git branch -D (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
end

function fmbr -d "Fuzzy-find and merge br"
    set -l branches (git branch --list)
    set -l branch (string join \n $branches | fzf -i +m --border --height 80% --extended --reverse --cycle --bind 'ctrl-u:preview-up,ctrl-d:preview-down')
    git merge (echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout $result
end

bind -M insert \cr 'eval (history | fzf)'

