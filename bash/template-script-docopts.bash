# ---
# description:
# language: bash
# name: template-script-docopts
# version: 0.1
# ---

#!/usr/bin/env bash
#
# @author
# @copyright
# @license

# Configuration
import_utilites=true

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

import() {
	# if we want to import common utilities
	if [ "$import_utilites" == true ]; then

		# if an env variable is not defined try a default location
		if [ -z $SCRIPTING_UTILITIES ]; then
			scripting_utilities=$HOME/.script/libs/utilities.sh
		fi

		# Source Scripting Utilities
		if [ -f "$scripting_utilites" ]; then
			source "$scripting_utilities"
		else
			echo "Scripting utilities not found!"
			echo "$scripting_utilities doesn't seem to exists."
			exit -1
		fi
	fi
}

main() {
	import

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
