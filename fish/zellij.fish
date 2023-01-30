if status is-interactive
and not set -q INTEGRATED_TERMINAL
  eval (zellij setup --generate-auto-start fish | string collect)
end

