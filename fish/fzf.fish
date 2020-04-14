function vz
	set -l file (fd -i | fzf -i +m --border --height 80% --extended --reverse --cycle --preview "bat --theme 'OneHalfDark' --style=numbers --color=always {}")
	echo "$file"
	if [ ! -z "$file" ]
		vim "$file"
	end
end

function cz
	set -l directory (fd -i -td | fzf -i +m --border --height 80% --extended --reverse --cycle --preview "exa -1 --color=always {}")
	echo "$directory"
	cd "$directory"
end

function ch
    set -l directory (fd -i -td . ~/ | fzf -i +m --border --height 80% --extended --reverse --cycle --preview "exa -1 --color=always {}")
    echo "$directory"
    cd "$directory"
end

# for Windows Subsystem for Linux
function cwh
    set -l directory (fd -i -td . /mnt/c/Users/ckdtj/ | fzf -i +m --border --height 80% --extended --reverse --cycle --preview "exa -1 --color=always {}")
    echo "$directory"
    cd "$directory"
end

function vwh
    set -l file (fd -i . /mnt/c/Users/ckdtj | fzf -i +m --border --height 80% --extended --reverse --cycle --preview "bat --theme 'OneHalfDark' --style=numbers --color=always {}")
    echo "$file"
    if [ ! -z "$file" ]
        vim "$file"
    end
end

function fif
    if count $argv > /dev/null
       rg --files-with-matches "$argv[1]" | fzf\
        --border\
        --height 80%\
        --extended\
        --ansi\
        --reverse\
        --cycle\
        --header 'Find in File'\
        --bind 'ctrl-u:preview-up,ctrl-d:preview-down'\
        --bind 'ctrl-v:execute(vim {} >/dev/tty </dev/tty)'\
        --preview "bat --theme='OneHalfDark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$argv[1]';or rg --ignore-case --pretty --context 10 '$argv[1]' {}"
    else
        echo "검색어를 입력해주세요"
    end
end
