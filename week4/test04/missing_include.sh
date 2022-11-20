#!/bin/dash

for c_file in $@
do
  h_title=$(cat "$c_file" | grep -E "^#.*\.h\"$" |cut -d"\"" -f2)
  for h_file in $h_title
  do
    if [ ! -e "$h_file" ]
    then
        echo "$h_file included into $c_file does not exist" 
    fi
  done
done
