#!/bin/dash

for img in "$@"
do
  time=$(find . -name "$img" -printf "%t")
  mogrify -gravity south -pointsize 36 -draw "text 0,10 '$time'"b"$img" &&
  touch -d "$time" "$img"
done
