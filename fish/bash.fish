function export
    bass export $argv
end

function sudo 
	if test "$argv" = !!
		eval command sudo $history[1]
	else
		command sudo $argv
	end
end
