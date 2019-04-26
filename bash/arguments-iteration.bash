# ---
# description:
# language: bash
# name: template-script-docopts
# version: 0.1
# ---

#!/usr/bin/env bash

if [ "$#" == "0" ]; then
	exit 1
fi

while (( "$#" )); do
	arg="$1"
	# do something with $arg

	shift
done
