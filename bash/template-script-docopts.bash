# ---
# description:
# language: bash
# name: template-script-docopts
# version: 0.2
# ---

#!/usr/bin/env bash
#
# @author
# @copyright
# @license

# Configuration
configure() {
import_utilites=true
	# exits the script if you try to use uninitialized variables
	set -o nounset
	# exits the script if any statement returns a non-true return value
	# if you are willing to continue when a statement fails you can use this
	# construct: command || true
	set -o errexit
}

usage() {
	cat << EOU
EOU
}

verbose() {
	[ $verbose = "true" ]
}

logverbose() {
	if verbose; then
		echo "${@}"
	fi
}

debug() {
	[ $debug = "true" ]
}

import_utilities() {
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

# This function will be called when the script exits or when one of TERM or
# INT signal is received.
cleanup() {
	# your cleaning code here ...
	exit -1
}

initialize() {
	# import utilities
	import_utilites

	# trap bad exits with the cleanup function
	trap cleanup EXIT INT TERM

	# run bash in debugging mode
	if debug; then
		set -x
	fi
}

main() {
	configure
	initialize

	if verbose; then
		echo "Verbose mode..."
		echo
	elif debug; then
		echo "Debug mode..."
		echo
	fi
}

# check if script is being executed
if [[ $0 == "$BASH_SOURCE" ]]; then
	eval "$(docopts -h "$(usage)" : "$@")"
	main
fi
