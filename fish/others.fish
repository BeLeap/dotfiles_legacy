function tm
	touch main."$argv"
end

status --is-interactive;and stty -ixon
fish_vi_key_bindings
