#!/bin/dash

mp3_file="$1"
base_dir="$2"
wget -qO- 'https://en.wikipedia.org/w/index.php? title=Triple_J_Hottest_100&oldid=1011365554&action=raw' | while read line; do
    # look for line which is start of Hottest 100 list for a year
case "$line" in *'File'*)
continue
        ;;
      *'[[Triple J Hottest 100, '[0-9][0-9][0-9][0-9]'|'[0-9][0-9][0-9][0-9]']]'*)
;; *)
continue
;;
esac
    # create a directory for a Hottest 100 year
album=$(echo "$line" | sed 's/.*\[\[//;s/|.*//') year=$(echo "$album" | sed 's/.*\ //') dir="$base_dir/Triple J Hottest 100, $year"
# shellcheck disable=SC2174
    mkdir -pm 755 "$dir"
    # read top 10 songs for year
track=1
while read line && [ $track -le 10 ]; do
case "$line" in '#'*)
;; *)
continue
;;
esac
        # remove links to wikipedia pages
line=$(echo "$line" | sed 's/[^[]*|//g')
# change slashes to hyphens - because can't have / in a filename
line=$(echo "$line" | sed 's/\//-/g') # remove some formatting characters
line=$(echo "$line" | tr -d '[]"#')
        # break line in two at en dash byte codes
artist=$(echo "$line" | sed 's/\xe2\x80\x93.*//') title=$(echo "$line" | sed 's/.*\xe2\x80\x93//')
        # trim leading spaces
artist=$(echo "$artist" | sed 's/^ *//') title=$(echo "$title" | sed 's/^ *//')
        # trim trailing spaces
artist=$(echo "$artist" | sed 's/ *$//') title=$(echo "$title" | sed 's/ *$//')
file="$dir/$track - $title - $artist.mp3" cp -p "$mp3_file" "$file"
track=$((track + 1))
done done#!/bin/dash
mp3_file="$1"
base_dir="$2"
wget -qO- 'https://en.wikipedia.org/w/index.php? title=Triple_J_Hottest_100&oldid=1011365554&action=raw' | while read line; do
    # look for line which is start of Hottest 100 list for a year
case "$line" in *'File'*)
continue
        ;;
      *'[[Triple J Hottest 100, '[0-9][0-9][0-9][0-9]'|'[0-9][0-9][0-9][0-9]']]'*)
;; *)
continue
;;
esac
    # create a directory for a Hottest 100 year
album=$(echo "$line" | sed 's/.*\[\[//;s/|.*//') year=$(echo "$album" | sed 's/.*\ //') dir="$base_dir/Triple J Hottest 100, $year"
# shellcheck disable=SC2174
    mkdir -pm 755 "$dir"
    # read top 10 songs for year
track=1
while read line && [ $track -le 10 ]; do
case "$line" in '#'*)
;; *)
continue
;;
esac
        # remove links to wikipedia pages
line=$(echo "$line" | sed 's/[^[]*|//g')
# change slashes to hyphens - because can't have / in a filename
line=$(echo "$line" | sed 's/\//-/g') # remove some formatting characters
line=$(echo "$line" | tr -d '[]"#')
        # break line in two at en dash byte codes
artist=$(echo "$line" | sed 's/\xe2\x80\x93.*//') title=$(echo "$line" | sed 's/.*\xe2\x80\x93//')
        # trim leading spaces
artist=$(echo "$artist" | sed 's/^ *//') title=$(echo "$title" | sed 's/^ *//')
        # trim trailing spaces
artist=$(echo "$artist" | sed 's/ *$//') title=$(echo "$title" | sed 's/ *$//')
file="$dir/$track - $title - $artist.mp3" cp -p "$mp3_file" "$file"
track=$((track + 1))
done done#!/bin/dash
mp3_file="$1"
base_dir="$2"
wget -qO- 'https://en.wikipedia.org/w/index.php? title=Triple_J_Hottest_100&oldid=1011365554&action=raw' | while read line; do
    # look for line which is start of Hottest 100 list for a year
case "$line" in *'File'*)
continue
        ;;
      *'[[Triple J Hottest 100, '[0-9][0-9][0-9][0-9]'|'[0-9][0-9][0-9][0-9]']]'*)
;; *)
continue
;;
esac
    # create a directory for a Hottest 100 year
album=$(echo "$line" | sed 's/.*\[\[//;s/|.*//') year=$(echo "$album" | sed 's/.*\ //') dir="$base_dir/Triple J Hottest 100, $year"
# shellcheck disable=SC2174
    mkdir -pm 755 "$dir"
    # read top 10 songs for year
track=1
while read line && [ $track -le 10 ]; do
case "$line" in '#'*)
;; *)
continue
;;
esac
        # remove links to wikipedia pages
line=$(echo "$line" | sed 's/[^[]*|//g')
# change slashes to hyphens - because can't have / in a filename
line=$(echo "$line" | sed 's/\//-/g') # remove some formatting characters
line=$(echo "$line" | tr -d '[]"#')
        # break line in two at en dash byte codes
artist=$(echo "$line" | sed 's/\xe2\x80\x93.*//') title=$(echo "$line" | sed 's/.*\xe2\x80\x93//')
        # trim leading spaces
artist=$(echo "$artist" | sed 's/^ *//') title=$(echo "$title" | sed 's/^ *//')
        # trim trailing spaces
artist=$(echo "$artist" | sed 's/ *$//') title=$(echo "$title" | sed 's/ *$//')
file="$dir/$track - $title - $artist.mp3" cp -p "$mp3_file" "$file"
track=$((track + 1))
done
done
