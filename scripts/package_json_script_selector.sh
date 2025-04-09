#!/bin/bash

SELECTED_SCRIPT=$(jq -r '.scripts | to_entries | .[] | .key' package.json | fzf --prompt="Select script: ")

if [ -z "$SELECTED_SCRIPT" ]; then
    echo "No script selected"
    exit 1
fi

npm run "$SELECTED_SCRIPT"
