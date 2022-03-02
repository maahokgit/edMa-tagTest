#!/bin/bash

read -e -p "Please enter a new Git Relese Version number: "  gitReleaseVersion
read -e -p "Please enter a new Git Relese Note: "  gitReleaseNote
read -e -p "Do you want to contiune with the Git Release? [y / n]: " confirmation


if [[ "$confirmation" == 'y' ]] ; 
then
    if [[ "$gitReleaseVersion" == '' ]] || [[ "$gitReleaseNote" == '' ]];
    then
        [ -z "$gitReleaseVersion" ] && echo "Git Release Version CANNOT be Empty"
        [ -z "$gitReleaseNote" ] && echo "Git Release Not CANNOT be Empty"
    else
        echo "Creating GitHub Release...Version $gitReleaseVersion"
        gh release create v"$gitReleaseVersion" --notes "$gitReleaseNote"
    fi
else
    echo "you select no"
fi