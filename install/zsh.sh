#!/bin/zsh

profile=".zshrc"
profileLocation=$HOME
if [ -n "$1" ]; then
	./install/any.unix.sh $profile $profileLocation true
else
	./install/any.unix.sh $profile $profileLocation
fi
source "$profileLocation/$profile"