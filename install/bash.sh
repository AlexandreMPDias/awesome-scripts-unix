#!/bin/bash

if [ -z "$AWESOME" ]; then
    echo Congratulations. You are installing [ Awesome ]
    echo You must be someone great. The Chosen One.
    echo The One Above All.
    echo With great codes, comes great responsibilities. Be careful
else
    echo "Awesome already installed"
    echo "Aborting"
    exit 1  
fi
location="$(dirname $(readlink -e $0))/.."
echo $location

# temp_sed_file="91820958-29412-03981251-932410239123"
# echo $location > $temp_sed_file
# regex="$(sed 's/\//\\\//g' $temp_sed_file)"
# rm $temp_sed_file

# if [ -z $1 ]; then
#     namespace="$HOME/.bashrc"
# else 
#     namespace="$1"
# fi

# echo $namespace

# if [ -z "$namesapce" ]; then
#     cat $namespace > ../../namespace.backup.txt
# fi
# sed "s/__path__/$regex/g" $location/automated/installationCmds.txt >> $namespace

# source $namespace