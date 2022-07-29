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
  echo "Session: $name"
  echo "Attaching to $HOST:$PORT"
  echo "########################"

  rm -f /tmp/docker.sock

  function cleanup --on-job-exit %self --inherit-variable name --inherit-variable PORT --inherit-variable HOST
    functions -e cleanup

    echo "###########################"
    echo "Cleaning: $name"
    echo "Dettaching from $HOST:$PORT"
    echo "###########################"

    ssh -q -S $name -p $PORT -O exit $HOST

    rm -f /tmp/docker.sock
    rm -f $name
  end

  ssh -M -S $name -p $PORT -fnNT -L /tmp/docker.sock:/var/run/docker.sock $HOST
  DOCKER_HOST=unix:///tmp/docker.sock eval $argv

  cleanup
  functions -e cleanup
end
