#!/bin/dash
code=$1
curl --location --silent http://www.timetable.unsw.edu.au/2022/"$code"KENS.html | grep -E "$code[0-9]+\.html\">" | grep -v -E "$code[0-9]+\.html\">[A-Z]{4}[0-9]{4}" | sed -e "s/.*=\"//g" | sed -e "s/\.html\">/ /g" | sed -e "s/<\/a><\/td>//g" | sort | uniq 

