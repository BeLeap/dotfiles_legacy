if status is-interactive
  set ZELLIJ_AUTO_ATTACH true
  set ZELLIJ_AUTO_EXIT true
  eval (zellij setup --generate-auto-start fish | string collect)
end

