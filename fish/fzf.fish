function vz
	set -l file (fd -i | fzf -i +m)
	echo "$file"
	if [ ! -z "$file" ]
		vim "$file"
	end
end

function cz
	set -l directory (fd -i -td | fzf -i +m)
	echo "$directory"
	cd "$directory"
end

function ch
    set -l directory (fd -i -td . ~/ | fzf -i +m)
    echo "$directory"
    cd "$directory"
end

# for Windows Subsystem for Linux
function cwh
    set -l directory (fd -i -td . /mnt/c/Users/ckdtj/ | fzf -i +m)
    echo "$directory"
    cd "$directory"
end
