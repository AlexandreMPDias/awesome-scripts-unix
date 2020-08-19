#!/bin/bash


if [[ -n "$__AWESOME_INSTALLED__" ]]; then
	echo "Awesome already installed"
    echo "Aborting"
    exit 0
fi

function abs_path() {
	(cd "$(dirname '$1')" &>/dev/null && printf "%s/%s" "$PWD" "${1##*/}")

}


function fixPath() {
	local temp_sed_file="91820958-29412-03981251-932410239123"
	echo $location > $temp_sed_file
	local regex="$(sed 's/\//\\\//g' $temp_sed_file)"
	rm $temp_sed_file
	echo $regex
}

function generateBackUp() {
	if [ -f $namespace ]; then
		local rel_path="$location/../../$profile.backup.txt"
		local local_path=$(abs_path $rel_path)
		echo ">> Generating back-up file at [$local_path]"
		cat $namespace > ../../$profile.backup.txt
	fi
}

function updateProfile() {
	local regex=$(fixPath)
	echo ">> Updating Profile [$profile]"
	sed "s/__path__/$regex/g" $location/automated/installationCmds.txt >> $namespace
}

function welcome() {
	echo "Congratulations. You are installing [ Awesome ]"
	echo "You must be someone great. The Chosen One."
	echo "The One Above All."
	echo "With great codes, comes great responsibilities. Be careful"
	echo \>\> "Installing Awesome for profile [$profile]"
	echo \>\> "Profile is located at [$profileLocation]"
}

profile=$1
profileLocation=$HOME

if [ -n "$2" ]; then
	profileLocation=$2
fi
if [ -n "$3" ]; then
	echo \>\> Using Forced Install
	unset $__AWESOME_INSTALLED__
fi
namespace="$profileLocation/$profile"
location="$(dirname $(readlink -e $0))/.."
set __AWESOME_INSTALLED__=1

welcome
generateBackUp
updateProfile


