#!/bin/bash
set -euo pipefail

while read LINE
do
    echo $LINE
    set -- $LINE
    if [[ $3 == joined. ]]; then
    curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"content":"'"$TEXT_LOGIN_LEFT$1$TEXT_LOGIN_RIGHT"'"}' "$WEBHOOK";
    elif [[ $3 == left. ]]; then
    curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"content":"'"$TEXT_LOGOUT_LEFT$1$TEXT_LOGOUT_RIGHT"'"}' "$WEBHOOK";
    fi
done
