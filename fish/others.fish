function tm
	touch main."$argv"
end

status --is-interactive;and stty -ixon
fish_vi_key_bindings

zoxide init fish | source

function dockerssh
  set -l name (random)
  set -q PORT; or set -l PORT 22
  echo "########################"
  echo "Attaching to $HOST:$PORT"
  echo "########################"
  rm -f /tmp/docker.sock
  function cleanup
    ssh -q -S $name -p $PORT -O exit $HOST
    rm -f /tmp/docker.sock
  end
  trap "cleanup" EXIT
  ssh -M -S $name -p $PORT -fnNT -L /tmp/docker.sock:/var/run/docker.sock $HOST
  DOCKER_HOST=unix:///tmp/docker.sock eval $argv
end
