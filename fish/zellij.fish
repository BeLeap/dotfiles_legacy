if status is-interactive
and not set -q INTEGRATED_TERMINAL
  set ZELLIJ_AUTO_ATTACH true
  set ZELLIJ_AUTO_EXIT true
  eval (zellij setup --generate-auto-start fish | string collect)
end

