#!/bin/bash
COUNT=$(makoctl list | yq -r '.data[] | length')

if [[ count > 0 ]]; then
  echo "\n$COUNT"
else
  echo ""
fi
