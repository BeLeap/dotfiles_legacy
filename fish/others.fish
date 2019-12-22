fish_vi_key_bindings

function tm
	touch main."$argv"
end

function gacp
	git add .; git commit -m "$argv"; git push origin master
end

stty -ixon
