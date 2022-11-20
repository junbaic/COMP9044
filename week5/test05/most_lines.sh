#!/bin/dash

max=0
for file in "$@"
do
  lines=$(wc -l $file|cut -d" " -f1)
  if test $lines -ge $max
  then
      max=$lines
      maxfile=$file
  fi
done
echo $maxfile
