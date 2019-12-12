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

function ch
    set -l directory (fd -i -td . ~/ | fzf +m)
    echo "$directory"
    cd "$directory"
end

# for Windows Subsystem for Linux
function cwh
    set -l directory (fd -i -td . /mnt/c/Users/ckdtj/ | fzf +m)
    echo "$directory"
    cd "$directory"
end
