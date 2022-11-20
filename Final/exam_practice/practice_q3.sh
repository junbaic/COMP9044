#!/bin/dash
for file in *
do
  number=$(ls $file | wc -w)
  if [ "$number" -ge 2 ]
  then
      echo $file
  fi
done
