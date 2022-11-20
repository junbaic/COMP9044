#!/bin/dash

direct1=$1
direct2=$2

for file in $direct1/*
do
  change_file=$(echo "$file"|sed -e "s/.*\///g")
  if test -e "$direct2/$change_file"
  then
      if diff "$direct1/$change_file" "$direct2/$change_file" >/dev/null
      then
          echo "$change_file"
      fi
  fi
done
