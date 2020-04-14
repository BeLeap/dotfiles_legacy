function export
	if [ $argv ]
		set -l var1 (echo $argv | cut -f1 -d=)
		set -l var2 (echo $argv | cut -f2 -d=)
		set -g -x $var1 &var2
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
