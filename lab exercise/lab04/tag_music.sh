#!/bin/dash

for path in "$@"
do 
  Album=$(basename "$path") 
  year=$(echo "$Album" | sed -E 's/.* //')

  for mp3_path in "$path"/*.mp3
  do 
    mp3_filename=$(basename "$mp3_path" .mp3)
    Track=$(echo "$mp3_filename" | sed -E 's/ - .*//')
    title=$(echo "$mp3_filename" | sed -E 's/^[0-9]* - //; s/ - .*//') 
    artist=$(echo "$mp3_filename" | sed -E 's/.* - //')
    id3 -t "$title" -T "$Track" -a "$artist" -A "$Album" -y "$year" "$mp3_path" > /dev/null 
  done
done
