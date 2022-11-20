#!/bin/dash

for file in *.htm
do
      html=$(echo "$file" | sed -e "s/.htm$/.html/")
      if [ -e "$html" ]
      then
          echo "$html exists"
          exit 1
      fi
      mv "$file" "$html" 2> /dev/null
done
