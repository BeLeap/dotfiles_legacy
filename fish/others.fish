fish_vi_key_bindings

function tm
	touch main."$argv"
end

function javar
	echo "$argv" > ~/.javar.tmp
	set -l file (cut -d '.' -f1 ~/.javar.tmp)
	javac "$argv"
	java "$file"
	rm -f ~/.javar.tmp
end

function gacp
	git add .; git commit -m "$argv"; git push origin master
end

stty -ixon
