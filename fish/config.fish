fish_vi_key_bindings

alias v "vim"
alias vimrc "vim ~/.vimrc"
alias fishrc "vim ~/.config/fish/config.fish"
alias sofish "source ~/.config/fish/config.fish"
alias clera "clear"
alias eixt "exit"
alias vm "vim main.*"
alias tmuxconf "vim ~/.tmux.conf"

alias gcmg "gcc main.c -g -o main"
alias gdm "gdb main"

stty -ixon

if [ $SHLVL = 1 ]
	cd
	tmux
end

function tm
	touch main."$argv"
end

function vz
	set -l file (fd -i | fzf +m)
	echo "$file"
	if [ ! -z "$file" ]
		vim "$file"
	end
end

function cz
	set -l directory (fd -i -td | fzf +m)
	echo "$directory"
	cd "$directory"
end

function javar
	echo "$argv" > ~/.javar.tmp
	set -l file (cut -d '.' -f1 ~/.javar.tmp)
	javac "$argv"
	java "$file"
	rm -f ~/.javar.tmp
end

function export
	if [ $argv ]
		set var (echo $argv | cut -f1 -d=)
		set val (echo $argv | cut -f2 -d=)
		set -g -x $var &val
	else
		echo 'export var=value'
	end
end

function sudo 
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end

function gacp
	git add .; git commit -m "$argv"; git push origin master
end
