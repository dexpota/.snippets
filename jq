jq ".. | if type == \"object\" then keys else empty end"
