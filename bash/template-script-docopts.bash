# ---
# description:
# language: bash
# name: template-script
# ---

#!/usr/bin/env bash
#
# @author
# @copyright
# @license

usage() {
	cat << EOU
EOU
}

verbose() {
	[ $verbose = "true" ]
}

debug() {
	[ $debug = "true" ]
}

main() {
	if verbose; then
		echo "Verbose mode..."
		echo
	elif debug; then
		echo "Debug mode..."
		echo
	fi
}

# check if script is being executed
if [[ $_ == $0 ]]; then
	eval "$(docopts -h "$(usage)" : "$@")"
	main
fi
