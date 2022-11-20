#!/bin/dash


for jpgImg in *.jpg
do
      pngImg=$(echo "$jpgImg" | sed -e "s/.jpg$/.png/")
      if [ -e "$pngImg" ]
      then
          echo "$pngImg already exists"
          exit 1
      fi
      convert "$jpgImg" "$pngImg" 2> /dev/null && rm "$jpgImg"
done