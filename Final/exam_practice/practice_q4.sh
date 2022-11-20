#!/bin/dash

number_n=$(echo "$1" | sed -E -e "s/[^0-9]//g")
number_m=$(echo "$2" | sed -E -e "s/[^0-9]//g")
string_left=$(echo "$1" | sed -E -e "s/[0-9].*//g")
string_right=$(echo "$1" | sed -E -e "s/.*[0-9]+//g")

while test "$number_n" -le "$number_m"
do
  echo $string_left$number_n$string_right
  number_n=$((number_n+1))
done

