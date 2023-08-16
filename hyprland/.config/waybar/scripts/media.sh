#!/bin/bash

STATUS=$(playerctl status)

if [[ "$STATUS" == "Playing" ]]; then
  ARTIST=$(playerctl metadata | grep artist | awk '{$1=$2=""; print $0}' | xargs)
  TITLE=$(playerctl metadata | grep title | awk '{$1=$2=""; print $0}' | xargs)
  echo '{"text": "'"$ARTIST"' - '"$TITLE"'"}'
fi                                    
