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
