#!/bin/dash

dicname=$1
if test $# -eq 1 
then
   if test -d .snapshot.$dicname 
   then
        snapshot-save.sh
	for file in .snapshot.$dicname/*
        do
	   cp $file .
	done
	echo "Restoring snapshot $dicname"
   fi
fi

